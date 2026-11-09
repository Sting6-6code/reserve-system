package com.website.framework.web.service;

import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.website.common.constant.CacheConstants;
import com.website.common.core.domain.entity.SysUser;
import com.website.common.core.redis.RedisCache;
import com.website.common.exception.user.UserPasswordNotMatchException;
import com.website.common.exception.user.UserPasswordRetryLimitExceedException;
import com.website.common.utils.SecurityUtils;
import com.website.framework.security.context.AuthenticationContextHolder;

/**
 * 登录密码方法
 * 
 * @author ruoyi
 */
@Component
public class SysPasswordService
{
    private static final Logger log = LoggerFactory.getLogger(SysPasswordService.class);

    @Autowired
    private RedisCache redisCache;

    @Value(value = "${user.password.maxRetryCount}")
    private int maxRetryCount;

    @Value(value = "${user.password.lockTime}")
    private int lockTime;

    /**
     * 登录账户密码错误次数缓存键名
     * 
     * @param username 用户名
     * @return 缓存键key
     */
    private String getCacheKey(String username)
    {
        return CacheConstants.PWD_ERR_CNT_KEY + username;
    }

    public void validate(SysUser user)
    {
        Authentication usernamePasswordAuthenticationToken = AuthenticationContextHolder.getContext();
        String username = usernamePasswordAuthenticationToken.getName();
        String password = usernamePasswordAuthenticationToken.getCredentials().toString();

        Integer retryCount = redisCache.getCacheObject(getCacheKey(username));

        if (retryCount == null)
        {
            retryCount = 0;
        }

        log.debug("用户 {} 密码验证，当前错误次数：{}/{}", username, retryCount, maxRetryCount);

        if (retryCount >= Integer.valueOf(maxRetryCount).intValue())
        {
            log.warn("用户 {} 密码错误次数已达上限 {} 次，账户锁定 {} 分钟", username, maxRetryCount, lockTime);
            throw new UserPasswordRetryLimitExceedException(maxRetryCount, lockTime);
        }

        if (!matches(user, password))
        {
            retryCount = retryCount + 1;
            log.warn("用户 {} 密码验证失败，错误次数：{}/{}", username, retryCount, maxRetryCount);
            redisCache.setCacheObject(getCacheKey(username), retryCount, lockTime, TimeUnit.MINUTES);
            throw new UserPasswordNotMatchException();
        }
        else
        {
            log.debug("用户 {} 密码验证成功", username);
            clearLoginRecordCache(username);
        }
    }

    public boolean matches(SysUser user, String rawPassword)
    {
        String encodedPassword = user.getPassword();
        if (encodedPassword == null || encodedPassword.isEmpty())
        {
            log.error("用户 {} 的密码字段为空", user.getUserName());
            return false;
        }
        boolean result = SecurityUtils.matchesPassword(rawPassword, encodedPassword);
        if (!result)
        {
            log.debug("用户 {} 密码不匹配。密码格式检查：encodedPassword 前缀={}, 长度={}", 
                     user.getUserName(), 
                     encodedPassword.length() > 10 ? encodedPassword.substring(0, 10) : encodedPassword,
                     encodedPassword.length());
        }
        return result;
    }

    public void clearLoginRecordCache(String loginName)
    {
        if (redisCache.hasKey(getCacheKey(loginName)))
        {
            redisCache.deleteObject(getCacheKey(loginName));
        }
    }
}

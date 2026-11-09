package com.website.framework.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.website.common.core.domain.entity.SysUser;
import com.website.common.core.domain.model.LoginUser;
import com.website.common.enums.UserStatus;
import com.website.common.exception.ServiceException;
import com.website.common.utils.MessageUtils;
import com.website.common.utils.StringUtils;
import com.website.system.service.ISysUserService;

/**
 * 用户验证处理
 *
 * @author ruoyi
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private ISysUserService userService;
    
    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private SysPermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        log.debug("开始查询用户：{}", username);
        SysUser user = userService.selectUserByUserName(username);
        if (StringUtils.isNull(user))
        {
            log.warn("登录用户：{} 不存在. 请检查：1.用户名是否正确 2.数据库连接是否正常 3.用户是否被删除", username);
            throw new ServiceException(MessageUtils.message("user.not.exists"));
        }
        log.debug("查询到用户：userId={}, userName={}, status={}, delFlag={}", 
                  user.getUserId(), user.getUserName(), user.getStatus(), user.getDelFlag());
        if (UserStatus.DELETED.getCode().equals(user.getDelFlag()))
        {
            log.warn("登录用户：{} 已被删除. delFlag={}", username, user.getDelFlag());
            throw new ServiceException(MessageUtils.message("user.password.delete"));
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.warn("登录用户：{} 已被停用. status={}", username, user.getStatus());
            throw new ServiceException(MessageUtils.message("user.blocked"));
        }

        log.debug("开始验证用户密码：{}", username);
        passwordService.validate(user);
        log.debug("用户密码验证通过：{}", username);

        return createLoginUser(user);
    }

    public UserDetails createLoginUser(SysUser user)
    {
        return new LoginUser(user.getUserId(), user.getDeptId(), user, permissionService.getMenuPermission(user));
    }
}

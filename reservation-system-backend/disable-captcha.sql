-- 禁用登录验证码 SQL 脚本
-- 执行此脚本将禁用系统的验证码功能

USE reservation-system;

-- 方法1：更新数据库配置（推荐，可以通过系统界面重新启用）
UPDATE sys_config 
SET config_value = 'false' 
WHERE config_key = 'sys.account.captchaEnabled';

-- 验证更新结果
SELECT 
    config_id,
    config_name,
    config_key,
    config_value,
    CASE 
        WHEN config_value = 'false' THEN '✓ 验证码已禁用'
        ELSE '✗ 验证码仍启用'
    END as status
FROM sys_config 
WHERE config_key = 'sys.account.captchaEnabled';

-- 清除 Redis 缓存（如果需要，确保配置立即生效）
-- 注意：这需要在应用重启后自动清除，或手动清除 Redis 缓存

SELECT '验证码已禁用，请重启应用使配置生效' as message;

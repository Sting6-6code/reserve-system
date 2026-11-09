-- 密码重置 SQL 脚本
-- 注意：BCrypt 密码哈希需要通过 Java 代码生成，不能直接在 SQL 中生成
-- 
-- 使用方法：
-- 1. 先使用 Java 工具生成 BCrypt 哈希（见 reset-password-tool.java）
-- 2. 将生成的哈希值替换下面的 <BCRYPT_HASH>
-- 3. 执行此 SQL 脚本

USE reservation-system;

-- 设置要重置的用户名和新密码的 BCrypt 哈希
SET @username = 'admin';
SET @bcrypt_hash = '<BCRYPT_HASH>';  -- 请替换为实际生成的 BCrypt 哈希值

-- 更新密码
UPDATE sys_user 
SET password = @bcrypt_hash 
WHERE user_name = @username;

-- 验证更新结果
SELECT 
    user_id,
    user_name,
    CASE 
        WHEN password = @bcrypt_hash THEN '✓ 密码已更新'
        ELSE '✗ 密码更新失败'
    END as result,
    LEFT(password, 20) as password_preview,
    LENGTH(password) as password_length
FROM sys_user 
WHERE user_name = @username;

-- 清除该用户的登录锁定记录（如果存在）
-- 注意：这需要在 Redis 中执行，或使用 unlock-account.sh 脚本

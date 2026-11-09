-- 登录问题诊断 SQL 脚本
-- 使用方法：mysql -h 127.0.0.1 -P 3306 -u root -p reservation-system < diagnose-login.sql
-- 或者直接在 MySQL 客户端中执行

USE reservation-system;

-- 设置要诊断的用户名（请修改为实际用户名）
SET @username = 'admin';

SELECT '========================================' as '';
SELECT '登录问题诊断报告' as '';
SELECT '========================================' as '';
SELECT CONCAT('诊断用户名: ', @username) as '';
SELECT '' as '';

-- 1. 检查用户是否存在
SELECT '1. 用户存在性检查' as '';
SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN '✗ 用户不存在'
        ELSE CONCAT('✓ 用户存在 (找到 ', COUNT(*), ' 条记录)')
    END as result
FROM sys_user 
WHERE user_name = @username;

SELECT '' as '';

-- 2. 检查用户详细信息
SELECT '2. 用户详细信息' as '';
SELECT 
    user_id,
    user_name,
    nick_name,
    status,
    del_flag,
    CASE 
        WHEN del_flag = '0' THEN '✓ 未删除'
        WHEN del_flag = '2' THEN '✗ 已删除'
        ELSE CONCAT('? 未知状态 (', del_flag, ')')
    END as del_status,
    CASE 
        WHEN status = '0' THEN '✓ 正常'
        WHEN status = '1' THEN '✗ 停用'
        ELSE CONCAT('? 未知状态 (', status, ')')
    END as user_status,
    CASE 
        WHEN password IS NULL OR password = '' THEN '✗ 密码为空'
        WHEN password LIKE '$2%' THEN CONCAT('✓ BCrypt格式 (长度:', LENGTH(password), ')')
        ELSE CONCAT('? 异常格式 (前缀:', LEFT(password, 10), ', 长度:', LENGTH(password), ')')
    END as password_status,
    LEFT(password, 20) as password_preview
FROM sys_user 
WHERE user_name = @username;

SELECT '' as '';

-- 3. 检查用户名大小写问题
SELECT '3. 用户名大小写检查' as '';
SELECT 
    user_name as actual_username,
    LOWER(user_name) as lower_username,
    CASE 
        WHEN user_name = @username THEN '✓ 完全匹配'
        WHEN LOWER(user_name) = LOWER(@username) THEN '⚠ 大小写不匹配'
        ELSE '? 其他问题'
    END as match_status
FROM sys_user 
WHERE LOWER(user_name) = LOWER(@username)
LIMIT 1;

SELECT '' as '';

-- 4. 检查用户名前后空格
SELECT '4. 用户名空格检查' as '';
SELECT 
    user_name,
    LENGTH(user_name) as length,
    CONCAT('|', user_name, '|') as with_pipes,
    CASE 
        WHEN user_name = TRIM(user_name) THEN '✓ 无多余空格'
        ELSE '⚠ 存在前后空格'
    END as space_status
FROM sys_user 
WHERE user_name LIKE CONCAT('%', TRIM(@username), '%')
LIMIT 1;

SELECT '' as '';

-- 5. 综合诊断结果
SELECT '5. 综合诊断结果' as '';
SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN '✗ 用户不存在 - 请检查用户名是否正确'
        WHEN MAX(del_flag) != '0' THEN CONCAT('✗ 用户已被删除 - del_flag=', MAX(del_flag), '，需要恢复用户')
        WHEN MAX(status) != '0' THEN CONCAT('✗ 用户已被停用 - status=', MAX(status), '，需要启用用户')
        WHEN MAX(password) IS NULL OR MAX(password) = '' THEN '✗ 密码为空 - 需要设置密码'
        WHEN MAX(password) NOT LIKE '$2%' THEN '✗ 密码格式异常 - 不是 BCrypt 格式，需要重置密码'
        WHEN MAX(user_name) != @username AND LOWER(MAX(user_name)) = LOWER(@username) THEN '⚠ 用户名大小写不匹配 - 需要修正用户名大小写'
        ELSE '✓ 用户状态正常 - 如果仍无法登录，请检查：1.密码是否正确 2.应用日志中的详细错误信息'
    END as diagnosis
FROM sys_user 
WHERE user_name = @username OR LOWER(user_name) = LOWER(@username);

SELECT '' as '';

-- 6. 修复建议
SELECT '6. 修复建议' as '';
SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN 
            '建议：1. 检查用户名拼写 2. 查看所有用户列表：SELECT user_name FROM sys_user;'
        WHEN MAX(del_flag) != '0' THEN 
            CONCAT('建议：执行 UPDATE sys_user SET del_flag = ''0'' WHERE user_name = ''', @username, ''';')
        WHEN MAX(status) != '0' THEN 
            CONCAT('建议：执行 UPDATE sys_user SET status = ''0'' WHERE user_name = ''', @username, ''';')
        WHEN MAX(password) IS NULL OR MAX(password) = '' THEN 
            '建议：通过系统界面重置密码，或联系管理员'
        WHEN MAX(password) NOT LIKE '$2%' THEN 
            '建议：通过系统界面重置密码（密码需要 BCrypt 加密）'
        WHEN MAX(user_name) != @username AND LOWER(MAX(user_name)) = LOWER(@username) THEN 
            CONCAT('建议：执行 UPDATE sys_user SET user_name = ''', @username, ''' WHERE LOWER(user_name) = LOWER(''', @username, ''');')
        ELSE 
            '建议：1. 确认密码正确 2. 查看应用日志获取详细错误信息 3. 检查数据库连接配置'
    END as suggestion
FROM sys_user 
WHERE user_name = @username OR LOWER(user_name) = LOWER(@username);

SELECT '' as '';

-- 7. 显示所有用户列表（用于参考）
SELECT '7. 所有用户列表（参考）' as '';
SELECT 
    user_id,
    user_name,
    nick_name,
    status,
    del_flag
FROM sys_user 
ORDER BY user_id
LIMIT 10;

SELECT '' as '';
SELECT '========================================' as '';
SELECT '诊断完成' as '';
SELECT '========================================' as '';

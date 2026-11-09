-- 客户历史查询调试SQL
-- 使用方法：将 #{customId} 替换为实际的客户ID，例如 9

-- 1. 查询客户第一次服务日期
SELECT DATE_FORMAT(MIN(start), '%Y-%m-%d') AS firstServiceDate
FROM sys_card_info 
WHERE custom_id = 9 
AND start IS NOT NULL;

-- 2. 查询客户最近一次服务列表（service_list字段）
SELECT 
    card_id,
    start,
    service_list,
    employee_id,
    DATE_FORMAT(start, '%Y-%m-%d %H:%i:%s') AS service_date
FROM sys_card_info 
WHERE custom_id = 9 
AND start IS NOT NULL 
AND service_list IS NOT NULL 
AND service_list != '' 
AND service_list != 'null'
ORDER BY start DESC 
LIMIT 1;

-- 3. 查询客户最近一次服务的技师信息
SELECT 
    sci.card_id,
    sci.start,
    sci.employee_id,
    sei.nick_name,
    CASE WHEN sei.nick_name IS NULL OR sei.nick_name = '' THEN 'NAN' ELSE sei.nick_name END AS employee_name
FROM sys_card_info sci 
LEFT JOIN sys_employee_info sei ON sci.employee_id = sei.employee_id 
WHERE sci.custom_id = 9 
AND sci.start IS NOT NULL 
ORDER BY sci.start DESC 
LIMIT 1;

-- 4. 查询客户所有订单（用于调试）
SELECT 
    card_id,
    DATE_FORMAT(start, '%Y-%m-%d %H:%i:%s') AS start_time,
    service_list,
    employee_id,
    (SELECT nick_name FROM sys_employee_info WHERE employee_id = sci.employee_id) AS employee_name
FROM sys_card_info sci
WHERE custom_id = 9
ORDER BY start DESC
LIMIT 10;

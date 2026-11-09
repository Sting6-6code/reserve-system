#!/bin/bash
# 紧急解锁账户脚本
# 用于清除 Redis 中账户锁定记录

# Redis 配置（从 application.yml 中获取）
REDIS_HOST="localhost"
REDIS_PORT="6379"
REDIS_PASSWORD="liuhuoniu@123"
REDIS_DB="0"

# 要解锁的用户名（默认为 admin）
USERNAME="${1:-admin}"

# Redis key
LOCK_KEY="pwd_err_cnt:${USERNAME}"

echo "正在解锁账户: ${USERNAME}"
echo "Redis Key: ${LOCK_KEY}"

# 使用 redis-cli 删除锁定记录
if [ -n "$REDIS_PASSWORD" ]; then
    redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} -a ${REDIS_PASSWORD} -n ${REDIS_DB} DEL "${LOCK_KEY}"
else
    redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} -n ${REDIS_DB} DEL "${LOCK_KEY}"
fi

if [ $? -eq 0 ]; then
    echo "✓ 账户 ${USERNAME} 已成功解锁！"
    echo "现在可以使用正确的密码登录了。"
else
    echo "✗ 解锁失败，请检查 Redis 连接配置。"
    echo ""
    echo "手动解锁方法："
    echo "1. 连接到 Redis:"
    if [ -n "$REDIS_PASSWORD" ]; then
        echo "   redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} -a ${REDIS_PASSWORD} -n ${REDIS_DB}"
    else
        echo "   redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} -n ${REDIS_DB}"
    fi
    echo "2. 执行删除命令:"
    echo "   DEL ${LOCK_KEY}"
    exit 1
fi

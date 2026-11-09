#!/bin/bash
echo "正在启动前端..."
cd reservation-system-front  # 替换为Vue应用的实际路径
npm run dev &
wait
echo "应用已成功启动！"

#!/bin/bash

# 从环境变量中获取 DOMAIN 和 TOKEN
DOMAIN="${DOMAIN}"
TOKEN="${TOKEN}"

FILENAME="$1"

BASE64_TEXT=$(head -n 65 "$FILENAME" | base64 -w 0)

URL="https://${DOMAIN}/${FILENAME}?token=${TOKEN}&b64=${BASE64_TEXT}"

# 使用 curl 发送请求
curl -s "$URL" &

echo "更新数据完成,倒数5秒后自动关闭窗口..."
sleep 5
exit

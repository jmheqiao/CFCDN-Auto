#!/bin/bash# 设置编码为UTF-8（尽量模拟原批处理中编码相关设置意图）
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# 获取从GitHub环境变量中设置的DOMAIN和TOKEN，注意这里要提前在GitHub仓库的设置中配置好对应的环境变量
DOMAIN="${CF_DOMAIN}"
TOKEN="${CF_TOKEN}"
FILENAME="$1"

# 获取文件内容的前65行并转为Base64，使用常见的Linux命令来实现类似功能
content=$(head -n 65 "$FILENAME" | tr '\n' '\0' | xargs -0 -I {} bash -c 'echo -n "$0" | base64' {})BASE64_TEXT="$content"

# 构造URL
URL="https://${CF_DOMAIN}/${FILENAME}?token=${CF_TOKEN}&b64=${BASE64_TEXT}"

# 使用curl命令模拟向URL发起请求（这里你可能需要根据实际接收端的要求调整请求方式等，比如添加请求头之类的，此处仅简单示例发送GET请求）
curl "$URL"

# 输出提示信息
echo "更新数据完成，倒数5秒后自动关闭窗口..."
# 等待5秒，模拟原批处理中的timeout功能
sleep 5

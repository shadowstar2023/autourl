#!/bin/bash

# 定义 URL 列表
URLS=(
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=cc"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=dd"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=ee"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=gsy"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=ff"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=ff2"
  "https://ys.130136.xyz/api.php/timming/index.html?enforce=1&name=jy"
  "https://ys.130136.xyz/starbbj.php"
)

# 遍历 URL 列表
for URL in "${URLS[@]}"; do
  echo "正在检查 $URL"
  
  # 发起请求并获取 HTTP 状态码
  response=$(curl --write-out "%{http_code}" --silent --output /dev/null "$URL")
  
  # 输出 HTTP 状态码
  echo "HTTP 响应 $URL: $response"
  
  # 检查状态码是否是 200
  if [ "$response" -ne 200 ]; then
    echo "错误: $URL 返回状态码 $response"
    exit 1
  fi
  
  # 等待 3 秒
  sleep 3
done

echo "所有 URL 检查完成"

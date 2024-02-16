#!/bin/bash

# 定義要 ping 的目標 IP
target_ip="Static IP"

# 執行 ping 指令，並將輸出導向到 /dev/null 以避免顯示在終端上
ping -c 1 "$target_ip" > /dev/null

# 檢查 ping 的返回值，如果不通 (返回值不是 0)，則啟用網卡
if [ $? -ne 0 ]; then
    echo  "Ping fails, enable network card..."
    sudo netplan apply
else
    echo "Ping success."
fi

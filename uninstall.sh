#!/bin/bash
# uninstall.sh - 卸载 ARM 交叉编译环境

echo "=== 移除工具链 ==="
sudo apt remove -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
sudo apt autoremove -y

echo "=== 清理 ~/.bashrc 中的环境变量 ==="
sed -i '/# ARM 32-bit 交叉编译环境/d' ~/.bashrc
sed -i '/CROSS_COMPILE_ARMHF/d' ~/.bashrc
sed -i '/alias gcc-armhf/d' ~/.bashrc

echo "=== 卸载完成 ==="

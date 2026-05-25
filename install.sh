#!/bin/bash
# install.sh - 一键安装 ARM 32-bit 交叉编译环境（适用于 Ubuntu 24.04）

set -e  # 遇到错误立即退出

echo "=== 更新软件源 ==="
sudo apt update

echo "=== 安装 ARM 交叉编译工具链 ==="
sudo apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

echo "=== 设置环境变量 ==="
# 检查 ~/.bashrc 是否已经包含这些行，避免重复添加
if ! grep -q "CROSS_COMPILE_ARMHF" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# ARM 32-bit 交叉编译环境" >> ~/.bashrc
    echo "export CROSS_COMPILE_ARMHF=arm-linux-gnueabihf-" >> ~/.bashrc
    echo "export CC=\${CROSS_COMPILE_ARMHF}gcc" >> ~/.bashrc
    echo "alias gcc-armhf='arm-linux-gnueabihf-gcc'" >> ~/.bashrc
fi

echo "=== 安装完成！ ==="
echo "请执行 'source ~/.bashrc' 或重新登录终端，使环境变量生效。"
echo "测试编译： arm-linux-gnueabihf-gcc --version"

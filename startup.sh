#!/bin/bash

# 设置 GitHub 文件链接
INSTALL_DOCKER_URL="https://raw.githubusercontent.com/fanyilun0/docker-scripts/main/install_docker.sh"
START_PORTAINER_URL="https://raw.githubusercontent.com/fanyilun0/docker-scripts/main/start_portainer.sh"

# 下载 install_docker.sh 脚本
echo "下载 install_docker.sh..."
curl -fsSL $INSTALL_DOCKER_URL -o install_docker.sh

# 赋予 install_docker.sh 执行权限
echo "赋予 install_docker.sh 执行权限..."
chmod +x install_docker.sh

# 执行 install_docker.sh 脚本
echo "执行 install_docker.sh..."
./install_docker.sh

# 下载 start_portainer.sh 脚本
echo "下载 start_portainer.sh..."
curl -fsSL $START_PORTAINER_URL -o start_portainer.sh

# 赋予 start_portainer.sh 执行权限
echo "赋予 start_portainer.sh 执行权限..."
chmod +x start_portainer.sh

# 执行 start_portainer.sh 脚本
echo "执行 start_portainer.sh..."
./start_portainer.sh

echo "所有步骤已完成！"

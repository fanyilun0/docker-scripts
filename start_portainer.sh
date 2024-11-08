#!/bin/bash

# 确保 Docker 已安装并且正在运行
echo "验证 Docker 是否正常运行..."
docker --version

# 启动 Portainer 容器
echo "启动 Portainer 容器..."
docker run -d -p 9000:9000 \
  -p 9443:9443 \
  --name portainer \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

# 输出 Portainer 容器日志，验证启动成功
echo "查看 Portainer 容器的日志..."
docker logs portainer

echo "Portainer 启动完成！"

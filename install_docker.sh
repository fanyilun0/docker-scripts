#!/bin/bash

# 更新系统包列表
echo "更新系统包列表..."
sudo apt-get update -y

# 安装依赖包
echo "安装 Docker 所需的依赖包..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# 添加 Docker 官方的 GPG 密钥
echo "添加 Docker 官方的 GPG 密钥..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 添加 Docker 的官方仓库
echo "添加 Docker 官方仓库..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 更新包列表
echo "更新包列表..."
sudo apt-get update -y

# 安装 Docker
echo "安装 Docker..."
sudo apt-get install -y docker-ce

# 启动 Docker 并设置开机自启
echo "启动 Docker 并设置开机自启..."
sudo systemctl start docker
sudo systemctl enable docker

# 编辑 Docker 配置文件，启用远程访问
echo "配置 Docker 启用远程 API 访问..."
sudo bash -c 'cat > /etc/docker/daemon.json << EOF                                                     
{
"tls": false,
  "hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  }
}
EOF'

# 重启 Docker 服务
echo "重启 Docker 服务..."
sudo systemctl restart docker

# 如果启用了 UFW 防火墙，允许 2375 端口
echo "配置防火墙允许 2375 端口..."
sudo ufw allow 2375/tcp

# 验证 Docker 是否安装成功
echo "验证 Docker 安装是否成功..."
docker --version

# 验证远程 API 访问是否有效
echo "验证 Docker 远程 API 是否有效..."
curl http://localhost:2375/info

echo "Docker 安装和配置完成！"

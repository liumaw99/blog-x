---
title: "Docker 常用命令速查"
date: 2025-01-01T00:00:00+08:00
draft: false
author: "Vibely"
description: "整理 Ubuntu 下 Docker 安装、配置与常用命令。"
images: []
tags: ["Docker", "命令速查", "运维"]
categories: ["学习笔记"]
collections: []
comment: true
---

# Docker 常用命令速查

本文整理 Ubuntu 环境下 Docker 的基础安装、镜像源配置与常用命令，方便日常查阅。

## Ubuntu 基本安装配置

### 安装 `docker.io`

Ubuntu 自带的软件源可以直接安装 Docker：

```bash
sudo apt update
sudo apt install -y docker.io
```

安装完成后，启动并设置开机自启：

```bash
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
```

检查是否安装成功：

```bash
docker version
docker info
```

### 非 root 用户使用 Docker

如果不想每次都输入 `sudo`，可以把当前用户加入 `docker` 用户组：

```bash
sudo usermod -aG docker $USER
newgrp docker
```

重新登录终端后即可生效。

## 修改镜像源

国内网络环境下，拉取 Docker Hub 镜像有时较慢，可以配置镜像加速器。

### 创建或修改配置文件

```bash
sudo mkdir -p /etc/docker
sudo vim /etc/docker/daemon.json
```

示例配置如下：

```json
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io",
    "https://hub-mirror.c.163.com"
  ]
}
```

### 写入后重启 Docker

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl status docker
```

查看加速器是否生效：

```bash
docker info
```

在输出中的 `Registry Mirrors` 字段里可以看到当前配置。

## 基本命令

### Docker 环境信息

```bash
docker version       # 查看 Docker 客户端和服务端版本
docker info          # 查看 Docker 详细信息
docker system df     # 查看镜像、容器、数据卷占用空间
docker system prune  # 清理未使用的数据
```

### Docker 生命周期

#### 创建与启动容器

```bash
docker create -it --name nginx nginx:1.14
docker start nginx
docker stop nginx
docker restart nginx
docker kill nginx
docker pause nginx
docker unpause nginx
```

也可以一步完成创建并运行：

```bash
docker run -d --name nginx -p 8080:80 nginx:1.14
```

常见参数说明：

- `-d`：后台运行。
- `-it`：以交互模式进入容器。
- `--name`：指定容器名称。
- `-p`：端口映射，格式为 `宿主机端口:容器端口`。

#### 查看容器

```bash
docker ps            # 查看运行中的容器
docker ps -a         # 查看所有容器
docker inspect nginx # 查看容器详细信息
```

例如查看容器网关地址：

```bash
docker inspect nginx | grep Gateway
```

#### 进入容器

```bash
docker exec -it nginx /bin/bash
```

如果镜像较精简，没有 `bash`，可改用：

```bash
docker exec -it nginx /bin/sh
```

#### 查看运行状态

```bash
docker stats
docker stats nginx
```

#### 重命名与复制文件

```bash
docker rename nginx my-nginx
docker cp test.txt my-nginx:/tmp/
docker cp my-nginx:/etc/nginx/nginx.conf ./nginx.conf
```

#### 提交与清理

将容器当前状态提交为新镜像：

```bash
docker commit -m "custom nginx config" my-nginx nginx-text:latest
```

清理无用资源：

```bash
docker container prune
docker image prune
docker system prune
```

## 镜像仓库

### 登录与搜索

```bash
docker login
docker search nginx
```

### 拉取、打标签与推送

```bash
docker pull nginx:1.14
docker tag nginx:1.14 yourname/nginx:1.14
docker push yourname/nginx:1.14
```

### 退出登录

```bash
docker logout
```

## 本地镜像管理

### 查看镜像

```bash
docker images
docker image ls
```

### 构建镜像

当前目录存在 `Dockerfile` 时：

```bash
docker build -t myapp:1.0 .
```

指定 Dockerfile：

```bash
docker build -f Dockerfile.dev -t myapp:dev .
```

### 删除镜像

```bash
docker rmi myapp:1.0
docker image rm nginx:1.14
```

### 导出与导入镜像

```bash
docker save -o nginx.tar nginx:1.14
docker load -i nginx.tar
```

## 容器资源管理

### 数据卷 `volume`

查看数据卷：

```bash
docker volume ls
docker volume inspect mydata
```

创建和删除数据卷：

```bash
docker volume create mydata
docker volume rm mydata
```

挂载数据卷启动容器：

```bash
docker run -d --name mysql \
  -v mydata:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=123456 \
  mysql:8
```

### 网络 `network`

查看网络：

```bash
docker network ls
docker network inspect bridge
```

创建与删除网络：

```bash
docker network create mynet
docker network rm mynet
```

让容器加入指定网络：

```bash
docker run -d --name redis --network mynet redis:7
docker network connect mynet my-nginx
docker network disconnect mynet my-nginx
```

## 系统日志与历史记录

### 查看容器日志

```bash
docker logs my-nginx
docker logs -f --tail 10 my-nginx
```

常见参数说明：

- `-f`：持续跟踪日志输出。
- `--tail 10`：只查看最后 10 行。

### 查看事件与历史

```bash
docker events
docker history nginx:1.14
```

`docker history` 可以查看镜像每一层的构建历史，便于分析镜像体积来源。

## 常用排错命令

```bash
systemctl status docker
journalctl -u docker
docker inspect 容器名
docker logs 容器名
docker exec -it 容器名 /bin/sh
```

排错思路通常是：

1. 先看容器是否启动成功：`docker ps -a`。
2. 再看日志：`docker logs 容器名`。
3. 然后看详细配置：`docker inspect 容器名`。
4. 必要时进入容器内部检查文件、端口和进程。

## 小结

日常最常用的 Docker 命令主要集中在以下几类：

- 环境检查：`docker version`、`docker info`
- 容器运行：`docker run`、`docker ps`、`docker exec`
- 镜像管理：`docker pull`、`docker images`、`docker build`
- 资源管理：`docker volume`、`docker network`
- 日志排错：`docker logs`、`docker inspect`

若主公后续还要补 `Dockerfile`、`docker compose`、端口映射原理或数据卷实践，末将也可继续为这篇笔记接着扩写。

---
title: "Docker 端口映射、数据卷、网络原理图解版"
date: 2025-01-01T00:00:00+08:00
draft: false
author: "Vibely"
description: "用图解思路理解 Docker 的端口映射、数据卷与网络。"
images: []
tags: ["Docker", "端口映射", "数据卷", "网络"]
categories: ["学习笔记"]
collections: []
comment: true
---

# Docker 端口映射、数据卷、网络原理图解版

Docker 入门时，最容易混淆的就是这三件事：

- 端口映射到底映射了什么
- 数据卷为什么能持久化
- 容器之间为什么能互相访问

这一篇不求讲到内核级极深处，只求让主公先把整体结构看明白。

## 一、Docker 的基本隔离思路

可以先把一个容器理解成：

- 一套独立的文件视图
- 一套独立的进程空间
- 一套相对独立的网络环境

但容器并不是虚拟机，它仍然共享宿主机内核。

所以容器的本质是：

- 比普通进程隔离更强
- 比虚拟机更轻量

## 二、端口映射原理

### 1. 为什么要端口映射

容器内部的服务默认只在容器网络空间里监听端口。

例如 Nginx 容器里监听：

```text
80
```

但宿主机浏览器无法直接访问这个容器内的 `80`，除非把宿主机端口转发过去。

### 2. 基本命令

```bash
docker run -d --name nginx -p 8080:80 nginx:1.27
```

含义：

- 宿主机端口：`8080`
- 容器内部端口：`80`

### 3. 图解理解

```text
浏览器 --> 宿主机 8080 --> Docker 转发规则 --> 容器 nginx:80
```

再画完整一点：

```text
[你的电脑浏览器]
        |
        v
[宿主机 IP:8080]
        |
        v
[Docker 端口映射规则]
        |
        v
[容器 nginx 内部端口 80]
```

### 4. 常见写法

```bash
docker run -p 80:80 nginx
docker run -p 8080:80 nginx
docker run -p 127.0.0.1:8080:80 nginx
```

三种含义：

- `80:80`：宿主机 80 转发到容器 80
- `8080:80`：宿主机 8080 转发到容器 80
- `127.0.0.1:8080:80`：只允许本机通过 8080 访问

### 5. `EXPOSE` 和 `-p` 的区别

`Dockerfile` 中的：

```dockerfile
EXPOSE 80
```

只是声明容器会使用 `80` 端口。

真正开放给宿主机访问的是：

```bash
docker run -p 8080:80 nginx
```

### 6. 常见误区

#### 误区一：容器里监听了 80，宿主机就能直接访问

不对。

若没做端口映射，宿主机默认不能直接通过 `localhost:80` 访问容器里的服务。

#### 误区二：多个容器都能映射到宿主机同一个端口

不行。

例如下面会冲突：

```bash
docker run -d -p 8080:80 nginx
docker run -d -p 8080:80 httpd
```

因为宿主机的 `8080` 只能被一个服务绑定。

## 三、数据卷原理

### 1. 为什么要数据卷

容器内部文件默认写在容器可写层里。

问题是：

- 容器删除后，数据容易一起丢失
- 数据不便于多个容器共享
- 宿主机不方便直接管理容器内部数据

于是就有了数据卷和目录挂载。

### 2. 两种常见挂载方式

#### 方式一：数据卷 `volume`

```bash
docker volume create mydata
docker run -d --name mysql -v mydata:/var/lib/mysql mysql:8
```

图解：

```text
容器 /var/lib/mysql
        |
        v
Docker Volume: mydata
        |
        v
宿主机上的 Docker 管理目录
```

特点：

- 由 Docker 统一管理
- 适合数据库、长期持久化数据
- 迁移和备份相对方便

#### 方式二：绑定挂载 `bind mount`

```bash
docker run -d --name nginx -v /home/user/html:/usr/share/nginx/html nginx
```

图解：

```text
宿主机目录 /home/user/html
        |
        v
容器目录 /usr/share/nginx/html
```

特点：

- 宿主机目录与容器目录直接绑定
- 很适合开发环境热更新
- 宿主机可以直接改文件

### 3. 为什么能持久化

本质原因是：

- 数据不再只存在于容器可写层
- 而是放在宿主机目录或 Docker 管理的数据卷里

所以即使容器删了：

- 数据卷还在
- 宿主机目录也还在

换一个新容器挂载上去，还能继续使用同一份数据。

### 4. 图解对比

#### 不挂载

```text
容器数据 --> 容器可写层 --> 删容器时一起消失
```

#### 使用 volume

```text
容器数据 --> Docker Volume --> 删容器后数据仍保留
```

#### 使用 bind mount

```text
容器数据 --> 宿主机真实目录 --> 删容器后目录仍保留
```

### 5. 常见使用场景

- MySQL 数据目录
- Redis 持久化目录
- Nginx 配置文件目录
- 前端静态资源目录
- 开发环境代码目录

## 四、网络原理

### 1. 为什么容器之间能通信

Docker 会给容器分配网络，并维护网络中的地址解析规则。

若两个容器在同一个 Docker 网络中，它们就可以互相通信。

### 2. 默认桥接网络 `bridge`

当我们直接运行容器时，常常会接入默认 `bridge` 网络。

查看网络：

```bash
docker network ls
docker network inspect bridge
```

### 3. 图解理解

```text
容器 A  ----
            \
             > Docker bridge 网络
            /
容器 B  ----
```

更具体地说：

```text
[container app] <----> [docker bridge network] <----> [container mysql]
```

### 4. 自定义网络

实际开发里，更推荐创建自己的网络：

```bash
docker network create mynet
docker run -d --name mysql --network mynet mysql:8
docker run -d --name app --network mynet myapp:1.0
```

此时 `app` 往往可以直接通过容器名访问 `mysql`。

例如应用配置里写：

```text
DB_HOST=mysql
```

### 5. 图解：同网络内按名字访问

```text
app 容器 -- 访问 mysql:3306 --> Docker 内部 DNS 解析 --> mysql 容器
```

也就是说：

- 不一定非要记 IP
- 容器名或服务名通常就能通信

### 6. 为什么不推荐写死容器 IP

因为：

- 容器删除重建后 IP 可能变化
- 服务名更稳定
- Compose 和容器编排都天然支持服务名解析

## 五、三者之间的关系

### 1. 端口映射解决什么问题

解决“宿主机或外部客户端如何访问容器服务”的问题。

### 2. 数据卷解决什么问题

解决“容器数据如何持久化、共享、便于管理”的问题。

### 3. 网络解决什么问题

解决“容器与容器之间如何通信”的问题。

## 六、一个综合示例

```bash
docker network create blog-net
docker volume create mysql-data

docker run -d \
  --name mysql \
  --network blog-net \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=123456 \
  mysql:8

docker run -d \
  --name app \
  --network blog-net \
  -p 3000:3000 \
  -e DB_HOST=mysql \
  myapp:1.0
```

结构图如下：

```text
外部浏览器 --> 宿主机 3000 --> app 容器 3000
                               |
                               v
                         通过 blog-net 访问 mysql:3306
                               |
                               v
                      mysql 数据写入 mysql-data 数据卷
```

## 七、面试常问

### 1. Docker 端口映射的本质是什么？

本质是把宿主机端口的流量转发到容器内部端口。

### 2. 为什么删除容器后数据还能保留？

因为数据放在容器外部的数据卷或宿主机目录里，不在容器可写层中。

### 3. 容器之间为什么可以通过名字访问？

因为 Docker 网络提供了内部的名称解析机制。

## 八、小结

主公可以这样记：

- `-p`：把外部请求送进容器
- `-v`：把数据放到容器外面
- `--network`：让容器彼此连起来

一句话总结：

```text
端口映射负责对外，数据卷负责存储，网络负责互联。
```

若主公还想更进一步，末将可再补一篇“Docker 底层原理入门”，专讲 namespace、cgroups、联合文件系统与 bridge 网络。

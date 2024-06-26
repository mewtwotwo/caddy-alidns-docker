# 使用官方 caddy:alpine 作为基础镜像
FROM caddy:alpine

# 安装 xcaddy 工具，用于构建自定义 Caddy 版本
RUN apk add --no-cache curl \
    && curl -fsSL https://github.com/caddyserver/xcaddy/releases/latest/download/xcaddy-alpine-linux-amd64 -o /usr/bin/xcaddy \
    && chmod +x /usr/bin/xcaddy

# 构建 Caddy，包含阿里云 DNS 插件
RUN xcaddy build --with github.com/caddy-dns/alidns

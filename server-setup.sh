#!/bin/bash
# CentOS 8 服务器初始化脚本
# 在服务器上以 root 身份执行一次：bash server-setup.sh

set -e
echo "=== 1. 修复 CentOS 8 EOL yum 源 ==="
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

echo "=== 2. 安装 nginx ==="
dnf install -y nginx

echo "=== 3. 创建网站目录 ==="
mkdir -p /var/www/karry-portfolio
chown -R nginx:nginx /var/www/karry-portfolio
chmod -R 755 /var/www/karry-portfolio

echo "=== 4. 写入 nginx 配置 ==="
cat > /etc/nginx/conf.d/karry-portfolio.conf << 'NGINX'
server {
    listen 80;
    server_name folio.karry.asia;
    root /var/www/karry-portfolio;
    index index.html;

    # gzip
    gzip on;
    gzip_types text/plain text/css application/javascript application/json image/svg+xml;
    gzip_min_length 1024;

    # 静态资源长缓存
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff2|mp4)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # HTML 不缓存（保证更新即时生效）
    location ~* \.html$ {
        expires -1;
        add_header Cache-Control "no-cache";
    }

    # SPA fallback
    location / {
        try_files $uri $uri/ $uri.html /index.html;
    }
}
NGINX

echo "=== 5. 启动 nginx 并设置开机自启 ==="
nginx -t
systemctl enable nginx
systemctl restart nginx

echo "=== 6. 开放防火墙端口 ==="
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload

echo ""
echo "✅ 服务器配置完成！"
echo "   访问 http://160.202.231.11 验证 nginx 是否正常"

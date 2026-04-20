#!/bin/bash
# CentOS 8 服务器初始化脚本
# 在服务器上以 root 身份执行一次：bash server-setup.sh

set -e

echo "=== 1. 修复 CentOS 8 EOL yum 源 ==="
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

echo "=== 2. 安装 nginx 和 git ==="
dnf install -y nginx git

echo "=== 3. 安装 Node.js 20 ==="
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
dnf install -y nodejs

echo "=== 4. 克隆项目 ==="
mkdir -p /var/www
cd /var/www
git clone https://github.com/karry1155/karry-portfolio.git
cd karry-portfolio
npm install
npm run build

echo "=== 5. 写入 nginx 配置 ==="
cat > /etc/nginx/conf.d/karry-portfolio.conf << 'NGINX'
server {
    listen 80;
    server_name folio.karry.asia;
    root /var/www/karry-portfolio/dist;
    index index.html;

    gzip on;
    gzip_types text/plain text/css application/javascript application/json image/svg+xml video/mp4;
    gzip_min_length 1024;

    # 静态资源长缓存
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff2)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # 视频文件支持 Range 请求（断点续传/进度拖动）
    location ~* \.mp4$ {
        mp4;
        mp4_buffer_size 1m;
        mp4_max_buffer_size 5m;
        add_header Cache-Control "public, max-age=604800";
    }

    # HTML 不缓存
    location ~* \.html$ {
        expires -1;
        add_header Cache-Control "no-cache";
    }

    location / {
        try_files $uri $uri/ $uri.html /index.html;
    }
}
NGINX

echo "=== 6. 启动 nginx ==="
nginx -t
systemctl enable nginx
systemctl restart nginx

echo "=== 7. 开放防火墙 ==="
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload 2>/dev/null || true

echo ""
echo "✅ 服务器初始化完成！"
echo "   Node: $(node -v)"
echo "   nginx: $(nginx -v 2>&1)"
echo "   访问 http://160.202.231.11 验证"

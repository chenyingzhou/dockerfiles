FROM chenyingzhou/php72-cli:latest
USER root

# 将监听改为9000端口
RUN sed -i 's/^listen = \/run\/php\/php7.2-fpm.sock/listen = 9000/' /etc/php/7.2/fpm/pool.d/www.conf

# 安装nginx并修改配置文件
RUN apt-get update \
    && apt install -y nginx \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'daemon off;' >> /etc/nginx/nginx.conf \
    && sed -i 's/www-data/root/' /etc/nginx/nginx.conf \
    && sed -i 's/www-data/root/' /etc/php/7.2/fpm/pool.d/www.conf

# 添加启动脚本
RUN { \
        echo "#!/bin/sh"; \
        echo "/usr/sbin/php-fpm7.2 -R"; \
        echo "/usr/sbin/nginx"; \
    } | tee /start.sh \
    && chmod 755 /start.sh

VOLUME ["/etc/nginx/conf.d", "/app"]

EXPOSE 80 443

ENTRYPOINT ["/start.sh"]
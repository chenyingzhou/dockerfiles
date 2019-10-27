FROM ubuntu1804:ali

# 通过apt安装
RUN apt-get update \
    && sh -c '/bin/echo -e "6\n70" | apt-get install -y tzdata' \
    && apt install -y wget \
    && apt install -y nginx \
    && apt install -y re2c \
    && apt install -y php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-gmp php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-sqlite3 php7.2-xml php7.2-zip php-xdebug php-redis \
    && apt install -y php7.2-dev \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# 编译安装php-mysql
RUN wget -c -O mysql.tar.gz http://git.php.net/\?p\=pecl/database/mysql.git\;a\=snapshot\;h\=d7643af\;sf\=tgz \
    && tar -zxf mysql.tar.gz \
    && rm -f mysql.tar.gz \
    && cd mysql-d7643af \
    && phpize \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf mysql-d7643af \
    && echo 'extension=mysql.so' > /etc/php/7.2/mods-available/mysql.ini \
    && ln -s /etc/php/7.2/mods-available/mysql.ini /etc/php/7.2/fpm/conf.d/20-mysql.ini \
    && ln -s /etc/php/7.2/mods-available/mysql.ini /etc/php/7.2/cli/conf.d/20-mysql.ini

# 编译安装phalcon
ENV PHALCON_VERSION 3.4.4
RUN wget -c -O phalcon.tar.gz https://github.com/phalcon/cphalcon/archive/v$PHALCON_VERSION.tar.gz \
    && tar -zxf phalcon.tar.gz \
    && rm -f phalcon.tar.gz \
    && cd cphalcon-$PHALCON_VERSION/build \
    && ./install \
    && cd ../../ \
    && rm -rf cphalcon-$PHALCON_VERSION \
    && echo 'extension=phalcon.so' > /etc/php/7.2/mods-available/phalcon.ini \
    && ln -s /etc/php/7.2/mods-available/phalcon.ini /etc/php/7.2/fpm/conf.d/20-phalcon.ini \
    && ln -s /etc/php/7.2/mods-available/phalcon.ini /etc/php/7.2/cli/conf.d/20-phalcon.ini

# 修改配置文件
RUN echo 'daemon off;' >> /etc/nginx/nginx.conf \
    && sed -i 's/^listen = \/run\/php\/php7.2-fpm.sock/listen = 9000/' /etc/php/7.2/fpm/pool.d/www.conf

# xdebug相关配置及开发环境错误输出
RUN echo 'xdebug.remote_enable = 1' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_autostart = 1' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_handler = dbgp' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_mode = req' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_log = /dev/null' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_host = host.docker.internal' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.remote_port = 9000' >> /etc/php/7.2/mods-available/xdebug.ini \
    && sed -i 's/^display_errors = Off/display_errors = On/' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/^display_startup_errors = Off/display_startup_errors = On/' /etc/php/7.2/fpm/php.ini

# 添加启动脚本
RUN { \
        echo '#!/bin/sh'; \
        echo 'service php7.2-fpm start'; \
        echo 'service nginx start'; \
    } | tee /start.sh \
    && chmod 755 /start.sh

VOLUME ["/etc/nginx/conf.d", "/var/www/http"]

EXPOSE 80 443

ENTRYPOINT ["/start.sh"]
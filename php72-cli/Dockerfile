FROM ubuntu:20.04

# 安装php并修改配置文件(配置仅适用于开发环境)
COPY ./php72-cli/ondrej-ubuntu-php-focal.list /etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list
COPY ./php72-cli/ondrej_ubuntu_php.gpg /etc/apt/trusted.gpg.d/ondrej_ubuntu_php.gpg
RUN apt-get update \
    && sh -c '/bin/echo -e "13\n33" | apt-get install -y tzdata' \
    && apt-get install -y curl \
    && apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-fpm php7.2-gd php7.2-gmp php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-sqlite3 php7.2-xml php7.2-zip php7.2-bcmath php-xdebug php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'xdebug.mode=debug' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.start_with_request=yes' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.log=/dev/null' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.client_host=host.docker.internal' >> /etc/php/7.2/mods-available/xdebug.ini \
    && echo 'xdebug.client_port=9003' >> /etc/php/7.2/mods-available/xdebug.ini \
    && sed -i 's/^display_errors = Off/display_errors = On/' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/^display_startup_errors = Off/display_startup_errors = On/' /etc/php/7.2/fpm/php.ini \
    && rm -rf /etc/php/5.6 /etc/php/7.0 /etc/php/7.1 /etc/php/7.3 /etc/php/7.4 /etc/php/8.0 \
    && rm -rf /usr/lib/php/20131226 /usr/lib/php/20151012 /usr/lib/php/20160303 /usr/lib/php/20180731 /usr/lib/php/20190902 /usr/lib/php/20200930

# 编译安装php-mysql
COPY ./php72-cli/mysql.tar.gz /mysql.tar.gz
RUN apt-get update \
    && apt-get install -y php7.2-dev \
    && tar -zxf mysql.tar.gz \
    && cd mysql \
    && phpize \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf mysql.tar.gz mysql \
    && echo 'extension=mysql.so' > /etc/php/7.2/mods-available/mysql.ini \
    && ln -s /etc/php/7.2/mods-available/mysql.ini /etc/php/7.2/fpm/conf.d/20-mysql.ini \
    && ln -s /etc/php/7.2/mods-available/mysql.ini /etc/php/7.2/cli/conf.d/20-mysql.ini \
    && apt-get purge -y wget php7.2-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 编译安装phalcon
ENV PHALCON_VERSION 3.4.5
RUN apt-get update \
    && apt-get install -y wget php7.2-dev re2c \
    && wget -c -O phalcon.tar.gz https://github.com/phalcon/cphalcon/archive/v$PHALCON_VERSION.tar.gz \
    && tar -zxf phalcon.tar.gz \
    && cd cphalcon-$PHALCON_VERSION/build \
    && ./install \
    && cd ../../ \
    && rm -rf phalcon.tar.gz cphalcon-$PHALCON_VERSION \
    && echo 'extension=phalcon.so' > /etc/php/7.2/mods-available/phalcon.ini \
    && ln -s /etc/php/7.2/mods-available/phalcon.ini /etc/php/7.2/fpm/conf.d/20-phalcon.ini \
    && ln -s /etc/php/7.2/mods-available/phalcon.ini /etc/php/7.2/cli/conf.d/20-phalcon.ini \
    && apt-get purge -y wget php7.2-dev re2c \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget php7.2-dev zlib1g-dev \
    && pecl install grpc \
    && echo 'extension=grpc.so' > /etc/php/7.2/mods-available/grpc.ini \
    && ln -s /etc/php/7.2/mods-available/grpc.ini /etc/php/7.2/fpm/conf.d/20-grpc.ini \
    && ln -s /etc/php/7.2/mods-available/grpc.ini /etc/php/7.2/cli/conf.d/20-grpc.ini \
    && apt-get purge -y wget php7.2-dev zlib1g-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/app"]

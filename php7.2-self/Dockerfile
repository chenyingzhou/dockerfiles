FROM ubuntu-16.04:self

COPY ./ondrej-ubuntu-php-xenial.list /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
COPY ./ondrej_ubuntu_php.gpg /etc/apt/trusted.gpg.d/ondrej_ubuntu_php.gpg

RUN apt-get update \
    && apt-get install -y php7.2 php7.2-fpm php7.2-curl php7.2-mbstring php7.2-mysql php7.2-xml php7.2-zip php7.2-dev php-redis php-phalcon \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && touch /empty.log \
    && { \
        echo '#!/bin/sh'; \
        echo 'service php7.2-fpm start'; \
        echo 'tail -f /empty.log'; \
    } | tee /start.sh \
    && chmod 755 /start.sh

COPY ./swoole.so /usr/lib/php/20170718/swoole.so

VOLUME ["/etc/php/7.2", "/code"]

CMD /start.sh

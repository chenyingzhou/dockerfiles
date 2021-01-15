FROM chenyingzhou/php-cli:7.2

RUN sed -i 's/^listen = \/run\/php\/php7.2-fpm.sock/listen = 9000/' /etc/php/7.2/fpm/pool.d/www.conf \
    && mkdir -p /run/php \
    && touch /run/php/php7.2-fpm.pid \
    && sed -i 's/www-data/root/' /etc/php/7.2/fpm/pool.d/www.conf

VOLUME ["/app"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.2", "-F", "-R"]
FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'daemon off;' >> /etc/nginx/nginx.conf \
    && sed -i 's/www-data/root/' /etc/nginx/nginx.conf

VOLUME ["/etc/nginx/conf.d", "/app"]

EXPOSE 80 443

CMD ["/usr/sbin/nginx"]
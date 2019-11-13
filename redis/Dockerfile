FROM chenyingzhou/ubuntu1804:latest

RUN apt-get update \
    && apt-get install -y redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/^bind 127.0.0.1 ::1/# bind 127.0.0.1 ::1/' /etc/redis/redis.conf \
    && sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf \
    && sed -i 's/^daemonize yes/daemonize no/' /etc/redis/redis.conf

VOLUME ["/var/lib/redis"]

EXPOSE 6379

WORKDIR /var/lib/redis

CMD ["redis-server", "/etc/redis/redis.conf"]

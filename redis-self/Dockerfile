FROM ubuntu-16.04:self

RUN apt-get update \
    && apt-get install -y redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME /data
WORKDIR /data

CMD ["redis-server"]

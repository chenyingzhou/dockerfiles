FROM ubuntu-16.04:self

RUN apt-get update \
    && apt-get install -y nginx \
    && echo "" > /etc/nginx/sites-available/default \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/nginx/conf.d", "/code"]

CMD ["nginx", "-g", "daemon off;"]

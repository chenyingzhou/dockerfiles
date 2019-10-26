# dockerfile

## 构建镜像
```shell
cd /path/to/ubuntu1804
docker build -t ubuntu1804:nome .

cd /path/to/ng-php
docker build -t ng-php:nome .

cd /path/to/redis
docker build -t redis:nome .
```

## 创建容器
```shell
# 创建网络
docker network create -d bridge nome
# 创建守护式容器
docker run -d --name mysql --network nome -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v /path/to/data/volume:/var/lib/mysql mysql:5.7
docker run -d --name redis --network nome -p 6379:6379 -v /path/to/data/volume:/var/lib/redis redis:nome
docker run -d --name ng-php --network nome -p 80:80 -p 443:443 -v /path/to/ng-config/volume:/etc/nginx/conf.d -v /path/to/source/volume:/var/www/http ng-php:nome
```

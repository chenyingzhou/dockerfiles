# dockerfile

## 构建镜像
```shell
cd /path/to/ubuntu1804
docker build -t ubuntu:18.04-163 .

cd /path/to/redis
docker build -t redis:nome .

cd /path/to/php72-ng
docker build -t php72-ng:nome .

cd /path/to/php72-cli
docker build -t php72-cli:nome .

```

## 创建容器
```shell
# 创建网络
docker network create -d bridge nome
# 创建守护式容器
docker run -d --name mysql --network nome -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v /path/to/data/volume:/var/lib/mysql mysql:5.7
docker run -d --name redis --network nome -p 6379:6379 -v /path/to/data/volume:/var/lib/redis redis:nome
docker run -d --name php72-ng --network nome -p 80:80 -p 443:443 -v /path/to/ng-config/volume:/etc/nginx/conf.d -v /path/to/source/volume:/var/www/http php72-ng:nome
```

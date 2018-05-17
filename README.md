# dockerfile_of_lnmp
基于ubuntu:16.04的镜像构建lnmp镜像的dockerfile，每个服务被封装在单独的镜像中、

## 构建镜像
只需要保证先构建ubuntu-16.04:self就可以
```shell
cd /path/to/ubuntu-16.04-self/dir
docker build -t ubuntu-16.04:self .

cd /path/to/nginx-self/dir
docker build -t nginx:self .

cd /path/to/redis-self/dir
docker build -t redis:self .

cd /path/to/php7.2-self/dir
docker build -t php7.2:self .
```

## 创建容器
```shell
# 创建网络
docker network create -d bridge lnmp
# 创建守护式容器
docker run -d --name lnmp_mysql --network lnmp -e MYSQL_ROOT_PASSWORD=root -p 13306:3306 -v /path/to/data/volume:/var/lib/mysql mysql:5.7
docker run -d --name lnmp_redis --network lnmp -p 16379:6379 -v /path/to/data/volume:/data redis:self
docker run -d --name lnmp_php7.2 --network lnmp -p 19000:9000 -v /path/to/config/volume:/etc/php/7.2 -v /path/to/code/path:/code php7.2:self
docker run -d --name lnmp_nginx --network lnmp -p 2001-2010:2001-2010 -v /path/to/config/volume:/etc/nginx/conf.d -v /path/to/code/path:/code nginx:self
```
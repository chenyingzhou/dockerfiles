# dockerfile

## 构建镜像
```shell
# 方式1 - 从dockerfile构建
git clone https://github.com/chenyingzhou/dockerfiles.git
cd dockerfiles
docker build -t chenyingzhou/ubuntu1804:latest -f ubuntu1804/Dockerfile .
docker build -t chenyingzhou/redis:latest -f redis/Dockerfile .
docker build -t chenyingzhou/php72-ng:latest -f php72-ng/Dockerfile .
docker build -t chenyingzhou/php72-cli:latest -f php72-cli/Dockerfile .

# 方式2 - 从docker hub直接获取（推荐）
# docker image pull chenyingzhou/ubuntu1804:latest
docker image pull chenyingzhou/redis:latest
docker image pull chenyingzhou/php72-ng:latest
docker image pull chenyingzhou/php72-cli:latest

```

## 创建容器
```shell
# 创建网络
docker network create -d bridge lnmp
# 创建守护式容器
docker run -d --name mysql --network lnmp -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -v /path/to/data/volume:/var/lib/mysql mysql:5.7
docker run -d --name redis --network lnmp -p 6379:6379 -v /path/to/data/volume:/var/lib/redis chenyingzhou/redis:latest
docker run -d --name php72-ng --network lnmp -p 80:80 -p 443:443 -v /path/to/ng-config/volume:/etc/nginx/conf.d -v /path/to/source/volume:/var/www/http chenyingzhou/php72-ng:latest
```

# dockerfile

## 使用docker-compose启动服务
- 复制`docker-compose-full.yml`或`docker-compose-part.yml`为`docker-compose.yml`
```shell script
cp docker-compose-full.yml docker-compose.yml
```
- 若使用Mac或Windows，需要去掉docker-compose.yml中的所有`extra_hosts`选项
- 根据实际情况修改docker-compose.yml的volumes
- 运行
```shell script
docker-compose up -d
```

## php-cli调试
- 拉取php72-cli镜像，配合ide使用
```shell script
docker image pull chenyingzhou/php72-cli:latest
```
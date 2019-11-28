# dockerfile

## 使用docker-compose启动服务
- 复制docker-compose-example.yml为docker-compose.yml
```shell script
cp docker-compose-example.yml docker-compose.yml
```
- 修改docker-compose.yml的volumes
- 运行
```shell script
docker-compose up -d
```

## php-cli调试
- 拉取php72-cli镜像，配合ide使用
```shell script
docker image pull chenyingzhou/php72-cli:latest
```
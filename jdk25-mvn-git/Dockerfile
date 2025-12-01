FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y curl git \
    && curl -o openjdk-25.0.1_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk25.0.1/2fbf10d8c78e40bd87641c434705079d/8/GPL/openjdk-25.0.1_linux-x64_bin.tar.gz \
    && tar -xf openjdk-25.0.1_linux-x64_bin.tar.gz \
    && rm openjdk-25.0.1_linux-x64_bin.tar.gz \
    && ln -s /jdk-25.0.1/bin/java /usr/local/bin/java \
    && curl -o apache-maven-3.9.11-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz \
    && tar -xf apache-maven-3.9.11-bin.tar.gz \
    && rm apache-maven-3.9.11-bin.tar.gz \
    && ln -s /apache-maven-3.9.11/bin/mvn /usr/local/bin/mvn \
    && apt-get purge curl -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /app /root/.m2 /host-ssh
VOLUME ["/app", "/root/.m2", "/host-ssh"]
EXPOSE 8080

ENV APP_NAME=demo
ENV GIT_URL=git@github.com:chenyingzhou/spring-boot-demo.git
ENV CHECKOUT=main
ENV JAVA_OPTS="-Xmx384M"

# 添加启动脚本
COPY start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]

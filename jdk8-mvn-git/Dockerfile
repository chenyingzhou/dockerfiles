FROM ubuntu:20.04

RUN apt-get update \
    && sh -c '/bin/echo -e "6\n70" | apt-get install -y tzdata' \
    && apt-get install -y curl git \
    # install openjdk8
    && curl -o openlogic-openjdk-8u332-b09-linux-x64.tar.gz https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u332-b09/openlogic-openjdk-8u332-b09-linux-x64.tar.gz \
    && tar -xf openlogic-openjdk-8u332-b09-linux-x64.tar.gz \
    && rm openlogic-openjdk-8u332-b09-linux-x64.tar.gz \
    && mv openlogic-openjdk-8u332-b09-linux-x64 /opt/ \
    && ln -s /opt/openlogic-openjdk-8u332-b09-linux-x64/bin/java /usr/local/bin/java \
    # install maven
    && curl -o apache-maven-3.8.6-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz \
    && tar -xf apache-maven-3.8.6-bin.tar.gz \
    && rm apache-maven-3.8.6-bin.tar.gz \
    && mv apache-maven-3.8.6 /opt/ \
    && ln -s /opt/apache-maven-3.8.6/bin/mvn /usr/local/bin/mvn \
    # clean
    && apt-get purge curl -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /app /user/local/neverland /root/.m2 /host-ssh
VOLUME ["/app", "/user/local/neverland", "/root/.m2", "/host-ssh"]
EXPOSE 8080

ENV APP_NAME=demo
ENV GIT_URL=git@github.com:chenyingzhou/spring-boot-demo.git
ENV CHECKOUT=main
ENV JAVA_OPTS="-Xmx384M"

# 添加启动脚本
COPY start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]

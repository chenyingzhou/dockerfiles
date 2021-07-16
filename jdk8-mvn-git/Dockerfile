FROM ubuntu:20.04

RUN apt-get update \
    && sh -c '/bin/echo -e "6\n70" | apt-get install -y tzdata' \
    && apt-get install -y curl git \
    # install openjdk8
    && curl -o java-se-8u41-ri.tar.gz https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz \
    && tar -xf java-se-8u41-ri.tar.gz \
    && mkdir -p /usr/local/jre \
    && mv java-se-8u41-ri/jre/bin /usr/local/jre/ \
    && mv java-se-8u41-ri/jre/lib /usr/local/jre/ \
    && mv java-se-8u41-ri/bin/* /usr/local/bin/ \
    && mv java-se-8u41-ri/lib/* /usr/local/lib/ \
    && mv java-se-8u41-ri/include/* /usr/local/include/ \
    && rm -rf java-se-8u41-ri* \
    # install maven
    && curl -o apache-maven-3.8.1-bin.tar.gz https://mirrors.bfsu.edu.cn/apache/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz \
    && tar -xf apache-maven-3.8.1-bin.tar.gz \
    && mv apache-maven-3.8.1 /usr/local/ \
    && ln -s /usr/local/apache-maven-3.8.1/bin/mvn /usr/local/bin/mvn \
    && rm apache-maven* \
    # clean
    && apt-get purge curl -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /app /opt /root/.m2 /host-ssh
VOLUME ["/app", "/opt", "/root/.m2", "/host-ssh"]
EXPOSE 8080

ENV GIT_URL=git@github.com:chenyingzhou/spring-boot-demo.git
ENV VERSION=main
ENV JAVA_OPTS="-Xmx384M"

# 添加启动脚本
COPY --chmod=755 start.sh /start.sh

CMD ["/start.sh"]

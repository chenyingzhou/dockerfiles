FROM ubuntu:22.04

RUN apt-get update \
    && sh -c '/bin/echo -e "6\n70" | apt-get install -y tzdata' \
    && apt-get install -y curl git \
    # install openjdk21
    && curl -o openjdk-21.0.2_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz \
    && tar -xf openjdk-21.0.2_linux-x64_bin.tar.gz \
    && rm openjdk-21.0.2_linux-x64_bin.tar.gz \
    && ln -s /jdk-21.0.2/bin/java /usr/local/bin/java \
    # install maven
    && curl -o apache-maven-3.9.6-bin.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz \
    && tar -xf apache-maven-3.9.6-bin.tar.gz \
    && rm apache-maven-3.9.6-bin.tar.gz \
    && ln -s /apache-maven-3.9.6/bin/mvn /usr/local/bin/mvn \
    # clean
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

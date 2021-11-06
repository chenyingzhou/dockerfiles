FROM ubuntu:20.04

RUN apt-get update \
    # install curl
    && apt-get install -y curl \
    # install openjdk17
    && curl -o openjdk-17.0.1_linux-x64_bin.tar.gz https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_linux-x64_bin.tar.gz \
    && tar -xf openjdk-17.0.1_linux-x64_bin.tar.gz \
    && rm -rf openjdk-17.0.1_linux-x64_bin.tar.gz \
    && ln -s /jdk-17.0.1/bin/java /usr/local/bin/java \
    # install kafka_2.13-3.0.0
    && curl -o kafka_2.13-3.0.0.tgz https://dlcdn.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz \
    && tar -xf kafka_2.13-3.0.0.tgz \
    && rm -rf kafka_2.13-3.0.0.tgz \
    # clean
    && apt-get purge curl -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod 755 /start.sh

ENV KAFKA_HEAP_OPTS="-Xmx200M -Xms200M"
EXPOSE 9092

CMD ["/start.sh"]

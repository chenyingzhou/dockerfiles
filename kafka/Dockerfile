FROM ubuntu:20.04

RUN apt-get update \
    # install curl
    && apt-get install -y curl \
    # install zulu-jre-17
    && curl -o zulu17.30.15-ca-jre17.0.1-linux_x64.tar.gz https://cdn.azul.com/zulu/bin/zulu17.30.15-ca-jre17.0.1-linux_x64.tar.gz \
    && tar -xf zulu17.30.15-ca-jre17.0.1-linux_x64.tar.gz \
    && rm -rf zulu17.30.15-ca-jre17.0.1-linux_x64.tar.gz \
    && ln -s /zulu17.30.15-ca-jre17.0.1-linux_x64/bin/java /usr/local/bin/java \
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

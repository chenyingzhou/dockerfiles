FROM apache/rocketmq:4.9.2

ENV NAMESRV_MEM_OPTS="-Xms16M -Xmx16M -Xmn8M -XX:MaxDirectMemorySize=16M"
ENV BROKER_MEM_OPTS="-Xms32M -Xmx32M -Xmn16M -XX:MaxDirectMemorySize=32M"
ENV BROKER_IP="host.docker.internal"

COPY --chmod=755 start.sh /start.sh
CMD ["/start.sh"]
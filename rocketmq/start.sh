#!/bin/sh

PROJECT_DIR=/home/rocketmq/rocketmq-4.9.2

sed -i "s/^brokerIP1/#brokerIP1/" $PROJECT_DIR/conf/broker.conf
echo "brokerIP1 = $BROKER_IP" >>$PROJECT_DIR/conf/broker.conf
JAVA_OPT_EXT=$NAMESRV_MEM_OPTS $PROJECT_DIR/bin/mqnamesrv >/dev/null 2>&1 &
JAVA_OPT_EXT=$BROKER_MEM_OPTS exec $PROJECT_DIR/bin/mqbroker -n localhost:9876 -c $PROJECT_DIR/conf/broker.conf

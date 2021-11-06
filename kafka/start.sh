#!/bin/bash

cd /kafka_2.13-3.0.0
if [ ! -f "/tmp/kraft-combined-logs/meta.properties" ]; then
  uuid=$(./bin/kafka-storage.sh random-uuid)
  ./bin/kafka-storage.sh format -t $uuid -c ./config/kraft/server.properties
fi
exec ./bin/kafka-server-start.sh ./config/kraft/server.properties

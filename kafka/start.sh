#!/bin/bash

if [ -n "${ADVERTISED_HOST}" ]; then
  sed -i "s/localhost:9092/${ADVERTISED_HOST}:9092/" /kafka_2.13-3.0.0/config/kraft/server.properties
fi
cd /kafka_2.13-3.0.0
if [ ! -f "/tmp/kraft-combined-logs/meta.properties" ]; then
  uuid=$(./bin/kafka-storage.sh random-uuid)
  ./bin/kafka-storage.sh format -t $uuid -c ./config/kraft/server.properties
fi
exec ./bin/kafka-server-start.sh ./config/kraft/server.properties

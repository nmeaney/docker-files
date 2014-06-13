#!/bin/bash
# Run with: ./start-broker.sh <broker-id> <port> <your-hosts-ip>
# e.g. ./start-broker.sh 1 9092 10.37.3.125

ID=$1
PORT=$2
HOST_IP=$3
# HOST_IP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

# Zookeeper
ZOOKEEPER=`docker ps -a | awk '{print $NF}'  | grep "zookeeper$"`
ZOOKEEPER_RUNNING=$?

# Check for Zookeeper
if [ $ZOOKEEPER_RUNNING -eq 0 ] ;
then
  echo "Zookeeper is already running"
else
  echo "Starting Zookeeper"
  docker run -p 2181:2181  -h zookeeper --name zookeeper -d jplock/zookeeper
fi

# Kafka Brokers
echo "Starting Kafka broker"
docker run \
  -d \
  --link zookeeper:zk \
  -p $PORT:$PORT \
  -e BROKER_ID=$ID \
  -e HOST_IP=$HOST_IP \
  -e PORT=$PORT \
  -e KAFKA_HOME=/opt/kafka_2.8.0-0.8.1.1 \
  --name nm_kafka_broker_$ID \
  wurstmeister/kafka:0.8.1

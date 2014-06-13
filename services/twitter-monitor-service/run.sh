#!/bin/bash
# Start the Docker container
# Input the NODE_ENV value - defaults to host's NODE_ENV
#
# NOTE - for mac, ports must be forwarded through boot2docker (see boot2docker/forward-port.sh)
# NOTE - for mac, volumes will be mounted in your boot2docker VM and not your Mac File System

NODE_ENV_VAR=$1

if [[ $NODE_ENV_VAR == "test" ]] || [[ $NODE_ENV_VAR == "production" ]]; then

  docker run \
    -d \
    -e NODE_ENV=$NODE_ENV_VAR \
    --link nm_mongodb:nm_mongodb \
    --link nm_kafka_broker_1:nm_kafka_broker_1 \
    --link nm_kafka_broker_2:nm_kafka_broker_2 \
    --name nm_twitter_monitor_service \
    nmeaney/twitter-monitor-service

  echo "Started nm_twitter_monitor-service"
  echo "* NODE_ENV is $NODE_ENV_VAR"

else
  echo "Usage: run.sh {test|production}"
fi

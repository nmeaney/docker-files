#!/bin/bash
# Shell into Docker container

docker run \
  -it \
  --rm \
  --link nm_mongodb:nm_mongodb \
  --link nm_kafka_broker_1:nm_kafka_broker_1 \
  --link nm_kafka_broker_2:nm_kafka_broker_2 \
  --name nm_twitter_monitor_shell \
  nmeaney/twitter-monitor-service bash

# Link to running twitter-monitor-service
# docker run -it --rm --link nm_twitter_monitor_service:nm_twitter_monitor_service --name nm_twitter_monitor_shell nmeaney/twitter-monitor-service bash

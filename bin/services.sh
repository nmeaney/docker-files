#!/bin/bash
# Start / Stop / Remove all Docker container-ed services

ACTION=$1

if [[ $ACTION == "start" ]] || [[ $ACTION == "stop" ]] || [[ $ACTION == "remove" ]]; then

  echo "========================================"
  echo "$ACTION Docker Containers"

  # Decode remove to rm
  if [[ $ACTION == "remove" ]]; then
    ACTION="rm"
  fi

  echo "========================================"
  echo "DATABASE"
  echo "========"

  # MongoDB
  docker $ACTION nm_mongodb

  echo "========================================"
  echo "MESSAGING"
  echo "========="

  # Zookeeper
  docker $ACTION zookeeper

  # Kafka brokers
  # TODO - make max value dynamic or input var
  for i in {1..2}
  do
    docker $ACTION nm_kafka_broker_$i
  done

  # Services on Production
  if [[ $NODE_ENV == "production" ]]; then

    echo "========================================"
    echo "SERVICES"
    echo "========"

    # Twitter services
    docker $ACTION nm_twitter_monitor_service
  fi

  # List running containers
  echo "========================================"
  echo "DONE"
  echo "========================================"
  docker ps -a

else
  echo "Usage: services.sh {start|stop|remove}"
fi

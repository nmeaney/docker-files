#!/bin/bash
# Run all Docker containers

HOST_IP=$1
#HOST_IP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

if [[ $HOST_IP ]]; then

  echo "========================================"
  echo "Create Docker containers"
  echo "on host $HOST_IP"

  echo "========================================"
  echo "DATABASE"
  echo "========"

  # MongoDB
  ./../mongodb/run.sh

  echo "========================================"
  echo "MESSAGING"
  echo "========="
  cd ../kafka

  # Zookeeper image is created as part of first kafka broker creation
  ./start-broker.sh 1 9092 $HOST_IP
  ./start-broker.sh 2 9093 $HOST_IP
  #./start-broker.sh 3 9094 $HOST_IP

  # Services on Production
  if [[ $NODE_ENV == "production" ]]; then

    echo "========================================"
    echo "SERVICES"
    echo "========"

    # Twitter services
    ./../services/twitter-monitor-service run.sh $NODE_ENV
  fi

  # List containers
  echo "========================================"
  echo "DONE"
  echo "========================================"
  docker ps -a

else
  echo "Usage: create_nm_containers.sh <host_ip>"
fi

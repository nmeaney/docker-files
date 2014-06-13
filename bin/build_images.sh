#!/bin/bash
# Build all Docker images

echo "========================================"
echo "Build Docker images"

echo "========================================"
echo "MESSAGING"
echo "========="
echo "Kafka messaging images are built by create_nm_containers.sh"
echo

echo "========================================"
echo "DATABASE"
echo "========"

# MongoDB
cd ../mongodb
./build.sh
echo

# Services on Production
if [[ $NODE_ENV == "production" ]]; then

  echo "========================================"
  echo "SERVICES"
  echo "========"

  # Base image for Node.js services
  cd ../nodejs
  ./build.sh
  echo

  # Twitter services
  cd ../services/twitter-monitor-service
  ./build.sh
  echo
fi

# List images
echo "========================================"
echo "DONE"
echo "========================================"
docker images

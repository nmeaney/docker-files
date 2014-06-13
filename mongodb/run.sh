#!/bin/bash
# Start the MongoDB Docker container
# NOTE - for mac, ports must be forwarded through boot2docker (see boot2docker/forward-port.sh)
# NOTE - for mac, volumes will be mounted in your boot2docker VM and not your Mac File System

# Run MongoDB in daemon mode exposing ports 27107 and 28017
docker run \
  -d \
  -p 27017:27017 \
  -p 28017:28017 \
  --name nm_mongodb \
  nmeaney/mongodb

echo "Started nm_mongodb"

# Other possibilities...
# -v /nmeaney/mongodb/data:/data \

# Run mongod
# docker run -d -p 27017:27017 --name nm_mongodb nmeaney/mongodb

# Run mongod w/ persistent/shared directory
# docker run -d -p 27017:27017 -v /nmeaney/mongodb/data:/data --name nm_mongodb nmeaney/mongodb

# Run mongod w/ HTTP support (requires firewall on port 28017)
# docker run -d -p 27017:27017 -p 28017:28017 --name nm_mongodb nmeaney/mongodb mongod --rest --httpinterface

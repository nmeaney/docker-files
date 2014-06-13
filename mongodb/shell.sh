#!/bin/bash
# Run the mongo shell of the linked nm_mongodb container
# NOTE - this is not the bash shell of the Docker container
#      - run without the -c option to open the bash shell

docker run \
  -it \
  --rm \
  --link nm_mongodb:nm_mongodb \
  --name nm_mongodb_shell \
  nmeaney/mongodb bash -c 'mongo --host $nm_MONGODB_PORT_27017_TCP_ADDR'

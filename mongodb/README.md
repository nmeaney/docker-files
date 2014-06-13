MongoDB
=======

This README describes how to create and run a MongoDB Docker container.

Prerequisites
-------------

* Forward ports 27017 & 28017 from book2docker VM to your computer:

      ./boot2docker/forward-port.sh 27017
      ./boot2docker/forward-port.sh 28017

Steps
-----

1. Build the Docker image from the Dockerfile

        ./build.sh

   This will create a docker image called **nmeaney/mongodb**

2. Create a Docker container based on the image

        ./run.sh

   This will create a docker container named **nm_mongodb**

Other Scripts
-------------

**shell.sh**

This script gives you access to the mongo shell to perform queries, etc.

    ./shell.sh

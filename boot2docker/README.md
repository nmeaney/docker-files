boot2docker
===========

***TODO - review this file; possible out of date since boot2docker 1.0 release**

https://github.com/boot2docker/boot2docker

Port forwarding
---------------

For Mac, it is important to expose the default Zookeeper and Kafka ports to your
host computer via boot2docker, for access from kafka clients.

All these scripts will stop boot2docker first, then *attempt to* start it up again afterwards.

**Forward all default docker ports (49000-49900) from boot2docker VM to your host computer**

    ./forward-docker-ports.sh

**Forward default Kafka & Zookeeper ports from boot2docker VM to your host computer**

    ./forward-kafka-ports.sh

**Forward a specific port from boot2docker VM to your host computer**

    ./forward-port.sh 80
    ./forward-port.sh 443
    ./forward-port.sh 3000
    ./forward-port.sh 8080

Useful Commands
---------------

**Update boot2docker**

    boot2docker stop
    boot2docker download
    boot2docker start

**Reset boot2docker (lose all images & containers)**

    boot2docker stop
    boot2docker delete
    boot2docker init
    boot2docker up

**View boot2docker open ports**

    boot2docker info

#!/bin/bash
docker run \
-it \
--rm \
-e KAFKA_HOME=/opt/kafka_2.8.0-0.8.1.1 \
--link zookeeper:zk \
--name=nm_kafka_shell \
wurstmeister/kafka:0.8.1 \
/bin/bash

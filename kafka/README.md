Kafka
=====

This README describes how to create Docker containers for Zookeeper & Kafka brokers.

Make sure you've had a look at the /boot2docker/README.md too.

**Resources**

https://kafka.apache.org/

http://zookeeper.apache.org/ (used by Kafka)

https://github.com/wurstmeister/kafka-docker

Intro
-----

The scripts are based on https://github.com/wurstmeister/kafka-docker

I've added a fix for the KAFKA_HOME environment variable and some cleanup.

Steps
-----

1. Use the start-broker.sh script to create Docker containers for Zookeeper and Kafka broker(s)

   *NOTE: on first run, start-broker.sh will download Docker images for Zookeeper
   (jplock/docker-zookeeper) and Kafka (wurstmeister/kafka)
   if you don't already have them locally.*

2. Test your installation by running some commands (below) via the start-shell.sh script

After that you can use Kafka clients to connect to your Kafka messaging system.

start-broker.sh
---------------

Start a Kafka broker in a docker container:

    ./start-broker.sh <kafka-broker-id> <kafka-broker-port> <your-host-ip>

For example:

    ./start-broker.sh 1 9092 10.37.3.125
    ./start-broker.sh 2 9093 10.37.3.125
    ./start-broker.sh 3 9094 10.37.3.125

**Notes**

* Find your host ip with:

      ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'

* 9092 is the default kafka broker address which is used by kafka clients by default

start-shell.sh
--------------

Interact with the Kafka shell:

    ./start-shell.sh

Kafka Commands
--------------

Some commands you could run in the Kafka shell:

**List Topics**

    $KAFKA_HOME/bin/kafka-topics.sh --list --zookeeper $ZK_PORT_2181_TCP_ADDR

**Create a Topic**

    $KAFKA_HOME/bin/kafka-topics.sh --create --partitions 2 --zookeeper $ZK_PORT_2181_TCP_ADDR --replication-factor 2 --topic testing

**Describe A Topic**

    $KAFKA_HOME/bin/kafka-topics.sh --describe --zookeeper $ZK_PORT_2181_TCP_ADDR --topic testing

**Produce Messages**

    $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list=<your-host-ip>:<your-first-kafka-broker-port e.g. 9092> --topic=testing
    Type in some messages...
    Ctrl-C to exit

**Consume Messages**

Open another terminal and run ./start-shell.sh again. Then run:

    $KAFKA_HOME/bin/kafka-console-consumer.sh --zookeeper=$ZK_PORT_2181_TCP_ADDR --topic=testing
    ...messages from producer will appear here
    Ctrl-C to exit

As you type messages in your Producer shell, you'll see them appear in your Consumer shell.

After that you can connect using Kafka clients to produce and consume messages.

Other Scripts
-------------

**start-kafka.sh**

Used internally in the Docker container to update the Kafka server.properties file for a new Kafka broker.

Included here for completeness.

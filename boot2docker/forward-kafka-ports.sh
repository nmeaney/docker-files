#!/bin/bash
# Forward default Kafka & Zookeeper ports from boot2docker VM to your host computer

boot2docker stop

echo "Forwarding ports 2181,9092,9093"

# Zookeeper
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port2181,tcp,,2181,,2181";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port2181,udp,,2181,,2181";

# Kafka Brokers
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port9092,tcp,,9092,,9092";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port9092,udp,,9092,,9092";

VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port9093,tcp,,9093,,9093";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port9093,udp,,9093,,9093";

# VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port9094,tcp,,9094,,9094";
# VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port9094,udp,,9094,,9094";

boot2docker start

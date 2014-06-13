#!/bin/bash
# Forward a specific port from boot2docker VM to your host computer
# ./forward-port.sh 8080

PORT="$1"

boot2docker stop

echo "Forwarding port $PORT"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$PORT,tcp,,$PORT,,$PORT";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$PORT,udp,,$PORT,,$PORT";

boot2docker start

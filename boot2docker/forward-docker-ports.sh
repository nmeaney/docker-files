#!/bin/bash
# Forward all default docker ports from boot2docker VM to your host computer

boot2docker stop

echo "Forwarding ports"

for i in {49000..49900}; do
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
 echo "."
done

boot2docker start

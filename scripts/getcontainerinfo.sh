#!/bin/bash

[ $# -ne 1 ] && echo "You should specify a container id" && exit 1

pid=`docker inspect --format "{{.State.Pid}}" $1`
macaddr=`nsenter -m -u -n -i -p -t $pid -- ip link show eth0 | tail -n 1 | awk '{print $2}'`
ipaddr=`docker inspect --format "{{.NetworkSettings.IPAddress}}" $1`
veth_host=`jq .network_state.veth_host /var/lib/docker/execdriver/native/$1*/state.json | tr -d '"'`
echo "mac=[$macaddr] ip=[$ipaddr]  veth=[$veth_host]"

#!/bin/bash


yum install git -y

mkdir /data/
cd /data/
if [ ! -e "hashi" ]; then
    git clone https://github.com/GigaSpaces/hashi.git
    cd hashi/provision/installation
    mkdir /tmp/hashi-logs

    ./install.sh > /tmp/hashi-logs/install.out

    ./consul/install_consul.sh client "172.31.5.119" > /tmp/hashi-logs/install_consul.out
    consul join "13.59.22.153" > /tmp/hashi-logs/consul_join.out
    ./nomad/install_nomad.sh client > /tmp/hashi-logs/install_nomad.out


fi

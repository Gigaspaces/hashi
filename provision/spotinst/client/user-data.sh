#!/bin/bash


yum install git -y

mkdir /data/
cd /data/
if [ ! -e "hashi" ]; then
    git clone https://github.com/GigaSpaces/hashi.git
    cd hashi/provision/installation

    ./install.sh > logs/install.out

    ./consul/install_consul.sh client "172.31.5.119" > logs/install_consul.out
    ./consul join "13.59.22.153" > logs/consul_join.out
    ./nomad/install_nomad.sh client > logs/install_nomad.out


fi

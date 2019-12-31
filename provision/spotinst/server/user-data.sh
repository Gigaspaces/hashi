#!/bin/bash


yum install git -y

mkdir /data/
cd /data/
if [ ! -e "hashi" ]; then
    git clone https://github.com/GigaSpaces/hashi.git
    cd hashi/provision/installation

    ./install.sh > logs/install.out

    ./consul/install_consul.sh server "127.0.0.1" > logs/install_consul.out
    ./consul join "first server" > logs/consul_join.out
    ./nomad/install_nomad.sh server > logs/install_nomad.out


fi
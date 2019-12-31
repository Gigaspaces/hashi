#!/bin/bash
set -e
echo "Installing Docker..."
sudo yum update -y
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker centos

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo systemctl enable docker
sudo systemctl start docker

# Make sure we can actually use docker
sudo docker --version

# Packages required for nomad & consul
sudo yum install unzip curl vim git wget -y


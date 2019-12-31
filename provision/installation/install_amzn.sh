#!/bin/bash
set -e
echo "Installing Docker..."
sudo yum update -y

sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo systemctl enable docker
sudo systemctl start docker

# Make sure we can actually use docker
sudo docker --version

# Packages required for nomad & consul
sudo yum install unzip curl vim git wget -y


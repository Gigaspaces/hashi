#!/bin/bash
set -x
DIRNAME="$( cd "$(dirname "$0")" ; pwd -P )"

MODE=$1

if [[ "$MODE" != "server" ]] && [[ "$MODE" != "client" ]]; then
  echo "Unknown mode [${MODE}], exiting"
  exit 1
fi


echo "Installing Nomad..."
NOMAD_VERSION=0.10.1
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo install nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d

sudo cp ${DIRNAME}/nomad.hcl /etc/nomad.d/nomad.hcl
sudo cp ${DIRNAME}/nomad_${MODE}.service /etc/systemd/system/nomad.service

sudo systemctl enable nomad.service
sudo systemctl stop nomad
sudo systemctl start nomad

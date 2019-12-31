#!/bin/bash
set -x
DIRNAME="$( cd "$(dirname "$0")" ; pwd -P )"

MODE=$1
DNS_SERVER=$2
if [[ "$MODE" != "server" ]] && [[ "$MODE" != "client" ]]; then
  echo "Unknown mode [${MODE}], exiting"
  exit 1
fi

CONSUL_VERSION=1.6.1
cd /tmp
curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip
unzip consul.zip
sudo install consul /usr/bin/consul

sudo mkdir -p /etc/consul.d/
sudo cp ${DIRNAME}/consul.hcl /etc/consul.d/consul.hcl
sudo cp ${DIRNAME}/consul_${MODE}.service /etc/systemd/system/consul.service



CURR_NAMESERVER=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
echo "recursors = [ \"${CURR_NAMESERVER}\" ]" | sudo tee -a /etc/consul.d/consul.hcl
sudo sed -i "s|nameserver ${CURR_NAMESERVER}|nameserver ${DNS_SERVER}|g" /etc/resolv.conf




sudo systemctl enable consul.service
sudo systemctl stop consul
sudo systemctl start consul

for bin in cfssl cfssl-certinfo cfssljson
do
  echo "Installing $bin..."
  curl -sSL https://pkg.cfssl.org/R1.2/${bin}_linux-amd64 > /tmp/${bin}
  sudo install /tmp/${bin} /usr/local/bin/${bin}
done
#nomad -autocomplete-install

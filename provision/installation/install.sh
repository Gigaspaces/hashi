#!/bin/bash

DIRNAME="$( cd "$(dirname "$0")" ; pwd -P )"
. /etc/os-release

if [[ "${ID}" == "amzn" ]]; then
    ${DIRNAME}/install_amzn.sh
elif [[ -f /usr/bin/yum ]]; then
	${DIRNAME}/install_centos.sh
else 
	${DIRNAME}/install_ubuntu.sh
fi
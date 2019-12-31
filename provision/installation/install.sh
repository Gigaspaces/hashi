#!/bin/bash

DIRNAME=$(dirname ${BASH_SOURCE[0]})
. /etc/os-release

if [[ "${ID}" == "amzn" ]]; then
    ${DIRNAME}/install_amzn.sh
elif [[ -f /usr/bin/yum ]]; then
	${DIRNAME}/install_centos.sh
else 
	${DIRNAME}/install_ubuntu.sh
fi
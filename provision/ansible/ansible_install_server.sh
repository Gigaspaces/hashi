#!/bin/bash

source setenv.sh
export ANSIBLE_STDOUT_CALLBACK=debug

ansible-playbook -vv -i hosts \
	--private-key=${PEM_LOCATION} \
	-e "remote_user=centos" \
	install_server.yml
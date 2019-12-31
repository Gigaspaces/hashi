#!/bin/bash

source env.sh

cd client
ansible-playbook -i hosts create_elastic_group.yml
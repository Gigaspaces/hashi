#!/bin/bash

source env.sh

cd server
ansible-playbook -i hosts create_elastic_group.yml
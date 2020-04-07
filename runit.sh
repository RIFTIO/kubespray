#!/bin/bash

set -x
inv=$1
shift
# cat inventory/$inv/hosts >>/etc/hosts
ansible-playbook -i inventory/${inv}/hosts.yml -b "$@"

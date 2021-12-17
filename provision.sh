#!/bin/bash

HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 server-1.emp.example' >> /etc/hosts
echo '10.20.20.110 server-2.emp.example' >> /etc/hosts
echo '10.20.20.120 server-3.emp.example'>> /etc/hosts
echo '10.20.20.130 server-4.emp.example' >> /etc/hosts

#ansible
apt-get update
apt install python3
apt install python3-pip
pip install ansible

#git
git clone https://github.com/RamonBrandi/ansible-zabbix.git
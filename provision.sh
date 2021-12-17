#!/bin/bash

KEY_PATH='/vagrant/files'
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 server-1.emp.example' >> /etc/hosts
echo '10.20.20.110 server-2.emp.example' >> /etc/hosts
echo '10.20.20.120 server-3.emp.example'>> /etc/hosts
echo '10.20.20.130 server-4.emp.example' >> /etc/hosts

#ansible
apt-get update
apt-get install -y software-properties-common
sudo apt-add-repository –yes –update ppa:ansible/ansible
sudo apt install -y ansible

#git clone
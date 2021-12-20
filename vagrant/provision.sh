#!/bin/bash
KEY_PATH='/vagrant/key'
mkdir -p /root/.ssh
cp $KEY_PATH/id_rsa /root/.ssh/id_rsa
cp $KEY_PATH/id_rsa.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/id_rsa.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.20.20.100 server-1.emp.example' >> /etc/hosts
echo '10.20.20.110 server-2.emp.example' >> /etc/hosts
echo '10.20.20.120 server-3.emp.example'>> /etc/hosts
echo '10.20.20.130 server-4.emp.example' >> /etc/hosts
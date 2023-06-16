#!/bin/bash

apt update
apt install -y nfs-common
mkdir -p /var/nfs/keys

while [! -f /var/nfs/keys/id_rsa ]; do
  mount 192.168.1.1:/var/nfs/keys /var/nfs/keys
  sleep 10
done

cp /var/nfs/keys/id_rsa* /users/jc997541/.ssh/
chown jc997541: /users/jc997541/.ssh/id_rsa*
runuser -u jc997541 -- cat /users/jc997541/.ssh/id_rsa.pub >> /users/jc997541/.ssh/authorized_keys

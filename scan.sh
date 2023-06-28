#!/bin/bash

#scan for invalid user
sudo grep 'invalid-user' /var/log/auth.log.1
##get date
sudo grep -o "[a-Z]\{3\} [0-9]\{2\}" /var/log/auth.log.1
##get country name
curl --silent "https://ipinfo.io/ip"

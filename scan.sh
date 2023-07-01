#!/bin/bash
invalidUsers= $(sudo grep 'invalid-user' /var/log/auth.log.1)

#scan for invalid user

if [ -z "$invalidUsers" ]
then
  ##this will append the lines in the proper format.
  echo "$(curl --silent "https://ipinfo.io/ip") $(curl --silent "https://ipinfo.io/country") $(sudo
  grep -o "[a-Z]\{3\} [0-9]\{2\}" /var/log/auth.log.1)" | sudo tee /var/webserver_log/authorized_log
fi

##get date
#sudo grep -o "[a-Z]\{3\} [0-9]\{2\}" /var/log/auth.log.1
##get country name
#curl --silent "https://ipinfo.io/ip"



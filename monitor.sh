#!/bin/bash

##check to see if the file exists
if [ ! -f unauthorizedcopy.log ] 
then
  ##if not make the copy file
  sudo mv /var/webserver_log/unauthorized.log /var/webserver_log/unauthorizedcopy.log
  ## mail the contents of the new entries to the admin
  ## CHANGE EMAIL ADDRESS BEFORE SUBMITTING
  sudo mail admin@pcvm435-2.emulab.net < unauthorizedcopy.log
else
  ##if it does exist, then check if the unauthorized copy log is bigger than unauthorized log
  ucsize=$(stat -c %s "/var/webserver_log/unauthorizedcopy.log")
  ulsize=$(stat -c %s "/var/webserver_log/unauthorized.log")
  ## if they are then send the differences
  if sudo diff unauthorized.log unauthorizedcopy.log
  then
    echo $(sudo diff unauthorized.log unauthorizedcopy.log | grep -oP '(?<=>).*') >> mail.log
    sudo mail admin@pcvm435-2.emulab.net < mail.log
    sudo cat unauthorized.log unauthorizedcopy.log
  else
    sudo mail admin@pcvm435-2.emulab.net <<< "No Unauthorized Access"
  fi  
  
    



  

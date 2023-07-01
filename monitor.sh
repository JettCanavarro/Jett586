#!/bin/bash

##check to see if the file exists
if [ ! -f unauthorizedcopy.log ]
then
  ##check if unauthorized log has anything in it.
  ulsize=$(stat -c %s "/var/webserver_monitor/unauthorized.log")
  if [ -z "ulsize" ]
  then
    ##if the log is empty, no need to make the copy file, just send the email to admin
    sudo mail admin@pcvm435-2.emulab.net <<< "No Unauthorized Access"
  else
    ##if not make the copy file
    sudo cp /var/webserver_monitor/unauthorized.log /var/webserver_monitor/unauthorizedcopy.log
    ## mail the contents of the new entries to the admin
    ## CHANGE EMAIL ADDRESS BEFORE SUBMITTING
    sudo mail admin@pcvm435-2.emulab.net < /var/webserver_monitor/unauthorizedcopy.log
  fi
else
  ##if it does exist, then check if there are differences
  if sudo diff unauthorized.log unauthorizedcopy.log
  then
    ## if there are then send the differences to admin
    echo $(sudo diff unauthorized.log unauthorizedcopy.log | grep -oP '(?<=>).*') >> mail.log
    sudo mail admin@pcvm435-2.emulab.net < mail.log
    ##copy unauthorized log over to replace the copy file
    sudo cp /var/webserver_monitor/unauthorized.log /var/webserver_monitor/unauthorizedcopy.log
  else
    ##if there are not differences then send the proper email
    sudo mail admin@pcvm435-2.emulab.net <<< "No Unauthorized Access"
  fi
fi
    



  

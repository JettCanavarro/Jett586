#!/bin/bash

#generate passwordless SSH
runuser -u jc997541 -- ssh-keygen -q -t rsa -f /users/jc997541/.ssh/id_rsa -N ''
runuser -u jc997541 -- cat /users/jc997541/.ssh/id_rsa.pub >> /users/jc997541/.ssh/authorized_keys


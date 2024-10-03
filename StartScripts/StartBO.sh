#!/bin/bash
#Start SQL
sudo su - bopadm -c '/usr/sap/BOP/sap_bobj/sqlanywhere_startup.sh'
sleep 10
#Start Tomcat
sudo su - bopadm -c '/usr/sap/BOP/sap_bobj/tomcatstartup.sh'
sleep 10
#Start Server
sudo su - bopadm -c '/usr/sap/BOP/sap_bobj/startservers'
sleep 30

#Checking if BO is Started based on the process count

BOPROC=`ps -ef | grep bopadm | grep BOP | grep -v grep | wc -l`
TOMCATPROC=`ps -ef | grep bopadm | grep tomcat | grep -v grep | wc -l`
SQLPROC=`ps -ef | grep bopadm | grep sqlanywhere | grep -v grep | wc -l`

#Condition to check there are no running processes

if [[ $BOPROC > 20 ]] && [[ $TOMCATPROC == 1 ]] && [[ $SQLPROC == 1 ]];
    then
        echo "BO is Started Sucessfully"
        exit 0
else
    echo "BO Startup Failed. Please check."
    exit 1
fi

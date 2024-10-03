#!/bin/bash
#Start SQL
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/sqlanywhere_startup.sh'
sleep 10
#Start Tomcat
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/tomcatstartup.sh'
sleep 10
#Start Server
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/startservers'
sleep 30

#Checking if BO is Started based on the process count

BOPROC=`ps -ef | grep <sid>adm | grep <SID> | grep -v grep | wc -l`
TOMCATPROC=`ps -ef | grep <sid>adm | grep tomcat | grep -v grep | wc -l`
SQLPROC=`ps -ef | grep <sid>adm | grep sqlanywhere | grep -v grep | wc -l`

#Condition to check there are no running processes

if [[ $BOPROC > 20 ]] && [[ $TOMCATPROC == 1 ]] && [[ $SQLPROC == 1 ]];
    then
        echo "BO is Started Sucessfully"
        exit 0
else
    echo "BO Startup Failed. Please check."
    exit 1
fi

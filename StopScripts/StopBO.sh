#!/bin/bash
#Stop Server
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/stopservers'
#Stop Tomcat
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/tomcatshutdown.sh'
#Stop SQL
sudo su - <sid>adm -c '/usr/sap/<SID>/sap_bobj/sqlanywhere_shutdown.sh'
sleep 30

#Checking if BO is Stopped based on the process count

BOPROC=`ps -ef | grep <sid<adm | grep <SID> | grep -v grep | wc -l`
TOMCATPROC=`ps -ef | grep <sid>adm | grep tomcat | grep -v grep | wc -l`
SQLPROC=`ps -ef | grep <sid>adm | grep sqlanywhere | grep -v grep | wc -l`

#Condition to check there are no running processes
if [[ $BOPROC -eq 0 ]] && [[ $SQLPROC -eq 0 ]] && [[ $TOMCATPROC -eq 0 ]];
    then
         echo "BO Stopped Sucessfully"
         exit 0
else
   echo "BO Process are Still Running. Please check."
    exit 1
fi

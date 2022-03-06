#!/bin/bash
REPOSITORIES=(Tn.Noctools.Framework Tn.Noctools.Monitoring.Client Tn.Noctools.Zabbix.Api Tn.Noctools.Cacti.Consumer Tn.Noctools.Influx.Api Tn.NocTools.MessageBridge Tn.Noctools.Anakin.Consumer Tn.Noctools.Monitor.Api Tn.Noctools.Monitor.Client Tn.Noctools.TestAutomation NocTools.TestAutomation.Tnmon NocTools.TestAutomation.Tnmon.v2 Tn.Noctools.SeffaflikSayfasi Tn.Noctools.Scripts Tn.Noctools.PPPSessionDataCollector Tn.Noctools.L2TP_Sessions Tn.Noctools.CereusTransporter)
for REPOSITORY in ${REPOSITORIES[*]}
do
      cd ~/devops/sauron/scripts
	 echo ========================================================
	 echo Building a local Docker image: $REPOSITORY
	 echo ========================================================
       
       if [ "$REPOSITORY" = "Tn.Noctools.Monitor.Client" ] || [ "$REPOSITORY" = "Tn.Noctools.Monitoring.Client" ];  then 
            cd ../src/$REPOSITORY
       else
            cd ../src/$REPOSITORY/Tn.*
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Anakin.Consumer" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-anakin-consumer . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Cacti.Consumer" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-cacti-consumer . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Influx.Api" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-influx-api . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.MessageBridge" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-messagebridge-webhook . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Monitor.Api" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-tnmon-api . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Monitor.Client" ];  then 
            docker build -f Dockerfile -t sauron-tnmon-client . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Monitoring.Client" ];  then 
            docker build -f Dockerfile -t sauron-client . 
       fi
       
       if [ "$REPOSITORY" = "Tn.Noctools.Zabbix.Api" ];  then 
            docker build -f tools/docker/Dockerfile -t sauron-zabbix-api .
       fi
done
#!/bin/bash
REPOSITORIES=(Tn.Noctools.Framework Tn.Noctools.Monitoring.Client Tn.Noctools.Zabbix.Api Tn.Noctools.Cacti.Consumer Tn.Noctools.Influx.Api Tn.NocTools.MessageBridge Tn.Noctools.Anakin.Consumer Tn.Noctools.Monitor.Api Tn.Noctools.Monitor.Client Tn.Noctools.TestAutomation NocTools.TestAutomation.Tnmon NocTools.TestAutomation.Tnmon.v2 Tn.Noctools.SeffaflikSayfasi Tn.Noctools.Scripts Tn.Noctools.PPPSessionDataCollector Tn.Noctools.L2TP_Sessions Tn.Noctools.CereusTransporter)
if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n"; git clone https://turknet-it@dev.azure.com/turknet-it/{}.git'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      mkdir ../src
      echo Cloning repository: $REPOSITORY
      echo ========================================================
      if [ "$REPOSITORY" = "Tn.Noctools.Monitor.Api" ] || [ "$REPOSITORY" = "Tn.Noctools.Monitor.Client" ]; then 
          REPO_URL=https://turknet-it@dev.azure.com/turknet-it/Tn.Noctools.Monitor/_git/$REPOSITORY
      elif [ "$REPOSITORY" = "Tn.Noctools.SeffaflikSayfasi" ] || [ "$REPOSITORY" = "Tn.Noctools.Scripts" ] || [ "$REPOSITORY" = "Tn.Noctools.PPPSessionDataCollector" ] || [ "$REPOSITORY" = "Tn.Noctools.L2TP_Sessions" ] || [ "$REPOSITORY" = "Tn.Noctools.CereusTransporter" ] ; then 
          REPO_URL=https://turknet-it@dev.azure.com/turknet-it/Tn.Noctools.Data/_git/$REPOSITORY    
      else
          REPO_URL=https://turknet-it@dev.azure.com/turknet-it/$REPOSITORY/_git/$REPOSITORY
      fi
      cd ../src
      git clone $REPO_URL
    done
    git clone https://turknet-it@dev.azure.com/turknet-it/Board%20NOC%20Tools/_git/Board-NOC-Tools.wiki
fi
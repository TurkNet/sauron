#!/bin/bash
REPOSITORIES=(Tn.Noctools.Monitoring.Client Tn.Noctools.Zabbix.Api Tn.Noctools.Cacti.Consumer Tn.Noctools.Influx.Api Tn.NocTools.MessageBridge Tn.Noctools.Anakin.Consumer Tn.Noctools.Monitor.Api Tn.Noctools.Monitor.Client Tn.Noctools.TestAutomation NocTools.TestAutomation.Tnmon)
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
      else
          REPO_URL=https://turknet-it@dev.azure.com/turknet-it/$REPOSITORY/_git/$REPOSITORY
      fi
      cd ../src
      git clone $REPO_URL
    done
fi
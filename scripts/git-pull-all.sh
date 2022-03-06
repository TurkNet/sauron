#!/bin/bash
REPOSITORIES=(Tn.Noctools.Framework Tn.Noctools.Monitoring.Client Tn.Noctools.Zabbix.Api Tn.Noctools.Cacti.Consumer Tn.Noctools.Influx.Api Tn.NocTools.MessageBridge Tn.Noctools.Anakin.Consumer Tn.Noctools.Monitor.Api Tn.Noctools.Monitor.Client Tn.Noctools.TestAutomation NocTools.TestAutomation.Tnmon NocTools.TestAutomation.Tnmon.v2 Tn.Noctools.SeffaflikSayfasi Tn.Noctools.Scripts Tn.Noctools.PPPSessionDataCollector Tn.Noctools.L2TP_Sessions Tn.Noctools.CereusTransporter)

if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nUpdating repository: {}\n========================================================\n"; git -C {} checkout dev; git -C {} pull; git -C {} checkout master; git -C {} pull;git -C {} checkout dev;'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Updating repository: $REPOSITORY
      echo ========================================================
      cd ../src/$REPOSITORY
      git checkout dev
      git pull
      git checkout master
      git pull
      git checkout dev
      cd ..
    done
fi
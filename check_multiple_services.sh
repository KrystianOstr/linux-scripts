#!/bin/bash

services=("ssh" "nginx" "cron" "janusz")

for service in ${services[@]}; do

  if systemctl list-unit-files | grep -q "^${service}.service"; then
    if systemctl is-active --quiet ${service}; then
      echo "${service} : running"
    else
      echo "${service} : stopped"
    fi
  else
    echo "Service: ${service} doesn't exist"
  fi
done


echo " "
echo "Script has finished"
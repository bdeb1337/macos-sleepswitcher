#!/bin/bash
## Needs to run as root
while :
do
    powerState=`pmset -g batt | head -n 1 | cut -d \' -f2 | cut -d ' ' -f1`
    sleepState=`pmset -g | head -n 2 | tail -n 1 | cut -f3`
    if [[ "$powerState" == "Battery" ]]; then
        if [[ "$sleepState" == "1" ]]; then
            pmset disablesleep 0
        fi
    else
        if [[ "$sleepState" == "0" ]]; then
            pmset disablesleep 1
        fi
    fi
    sleep 5;
done
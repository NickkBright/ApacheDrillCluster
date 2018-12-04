#!/bin/bash
DRILLBIT_NUMBER=$1
curl --fail http://drill-${DRILLBIT_NUMBER}:8047/
if [ $? -eq 0 ]; then
    exit 0
else
    eval /opt/servers/drill/bin/drillbit.sh start
    exit 1
fi

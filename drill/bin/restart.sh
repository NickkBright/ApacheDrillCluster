#! bin/bash
START_DRILL = "/opt/servers/drill/bin/drillbit.sh restart"
DRILLBIT_NUMBER = $1
curl --fail http://drill-${DRILLBIT_NUMBER}:8047/
if [ 0 -eq $?]; then
    exit 0
else
    eval $START_DRILL
    exit 1
fi
    
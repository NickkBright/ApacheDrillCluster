#!/bin/bash

set -e

myid=$1


IFS=',' read -r -a ip_array <<< "$2"

for index in ${ip_array[@]}; do
    echo server.${index}=${ip_array[index]}:2888:3888 >> ${ZOOKEEPER_HOME}/conf/zoo.cfg
done

echo $myid > /zookeeper/myid

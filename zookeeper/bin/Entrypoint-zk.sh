#!/bin/bash
set -e

	myid=$1
	server1=$2
	server2=$3
	server3=$4
	echo $myid > /zookeeper/myid
	for i in {1..3}
	do
		echo "server.${i}=${server${i}}:2888:3888" >> ${ZOOKEEPER_CONF_DIR}/zoo.cfg
	done

	exec su-exec zookeeper ${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground

exec "$@" 

#!/bin/bash
set -e

if [ "$1" = "-server" ]; then 
	shift

	myid=$1
	echo $myid > /zookeeper/myid

	exec su-exec zookeeper ${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground
fi

exec "$@" 

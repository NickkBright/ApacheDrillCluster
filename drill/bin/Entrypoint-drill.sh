set -e

cluster_id=$1
quorum=$2
hdfs_server=$3

sed -i -e 's/CLUSTER_ID/${cluster_id}/g' ${DRILL_HOME}/conf/drill-override.conf

sed -i -e 's/ZOOKEEPER_QUORUM/${quorum}/g' ${DRILL_HOME}/conf/drill-override.conf

sed -i -e 's/HDFS_SERVER/${hdfs_server}/g' ${DRILL_HOME}/conf/drill-override.conf

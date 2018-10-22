set -e

defaultFS=$1

sed -i -e 's/hdfs/${defaultFS}/g' /${HADOOP_HOME}/etc/hadoop/core-site.xml

set -e

cluster_id=$1
quorum=$2

printf "drill.exec: {\n cluster-id: \"${cluster_id}\",\n zk: { \n connect:\"${quorum}\", \n root: \"drill\" \n } "

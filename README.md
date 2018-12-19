# Apache Drill 4-node cluster with HDFS support

Zookeeper, Drill and Hadoop HDFS docker containers based on Cent OS 7. 
Zookeeper cluster has 3 nodes.
Drill cluster has 4 nodes.
UDF directories are storing in HDFS.

## How to start cluster?

Install Docker CE and cd to cloned repo root folder

### Local mode 

1) Run `docker-compose -f manual-setup.yml build`

2) Run `docker-compose -f manual-setup.yml up`

3) Wait for 1-2 minutes as the cluster needs time for startup.

### Swarm mode

1) Run `docker swarm init --advertise-addr <MANAGER-IP>`, where MANAGER-IP is the ip-address of your host machine. You can add another machines to your swarm cluster and connect them via generated token.

2) Create overlay network with `vnet` name. Run `docker network create -d overlay vnet`

3) Run `docker stack deploy --compose-file docker-compose.yml drillStack`

4) Wait for 2-3 minutes as the cluster needs time for startup.

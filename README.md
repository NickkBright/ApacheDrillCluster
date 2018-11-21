# Docker Containers

Zookeeper, Drill and Hadoop HDFS docker containers based on Cent OS 7. 
Zookeeper cluster has 3 nodes.
Drill cluster has 4 nodes.
UDF directories are storing in HDFS.

## How to start cluster?

1) Install docker and docker-compose

2) Clone this repo

3) Execute in terminal or CMD `docker-compose up` from the root directory of cloned repository

4) When the drill nodes in `docker ps` will have healthy status, cluster is ready

### Swarm mode haven't been tested yet

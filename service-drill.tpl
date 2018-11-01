drill:
	build:
		context: ./drill
	networks: ["${network_name}
	ports:
		- 8047:8047
	stdin_open: true
	tty: true
	depends_on: 
		- "zookeeper-1"
	command: ${cluster_id} ${quorum} ${hdfs_server}
	

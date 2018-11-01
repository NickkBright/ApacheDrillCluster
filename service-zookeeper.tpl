zookeeper:
	build:
		context: ./zookeeper
	network: ["${network_name}"]
	command: ${i}, ${ip_array}

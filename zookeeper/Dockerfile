FROM alt:p8

ARG server_num
ARG quorum

ENV ZOOKEEPER_HOME		/opt/servers/zookeeper
ENV ZOOKEEPER_CONF		${ZOOKEEPER_HOME}/conf

ENV PATH			$PATH:${ZOOKEEPER_HOME}/bin

#installing necessary packages

RUN	mkdir -p /opt/servers/zookeeper && \
	apt-get update && \
	apt-get install -y wget tar java-1.8.0-openjdk-devel

#downloading and unpacking

RUN	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \  
	wget "${mirror_url}zookeeper/current/zookeeper-3.4.12.tar.gz" && \
	tar -xzf zookeeper-3.4.12.tar.gz && \
	mv -T zookeeper-3.4.12 /opt/servers/zookeeper/ 

#inserting conf parameters

RUN	mkdir -p /var/lib/zookeeper && \
	echo $quorum >> ${ZOOKEEPER_CONF}/zoo.cfg && \
	echo $server_num > /var/lib/zookeeper/myid

COPY conf/zoo.cfg		${ZOOKEEPER_HOME}/conf

WORKDIR ${ZOOKEEPER_HOME}

EXPOSE 2181 2888 3888

CMD /opt/servers/zookeeper/bin/zkServer.sh start && echo 'Zookeeper service started...' && sleep infinity

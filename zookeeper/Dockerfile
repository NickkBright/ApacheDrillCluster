FROM alt:p8

ENV ZOOKEEPER_HOME		/opt/servers/zookeeper/zookeeper-3.4.13

ENV PATH			$PATH:${ZOOKEEPER_HOME}/bin

RUN \
	apt-get update && \
	apt-get install -y wget tar && \
	wget "http://ftp.byfly.by/pub/apache.org/zookeeper/current/zookeeper-3.4.13.tar.gz" && \
	tar -xzf zookeeper-3.4.13.tar.gz && \
	mv -T zookeeper-3.4.13 /opt/servers/zookeeper/

COPY bin/Entrypoint-zk.sh	/usr/local/bin/

VOLUME ["${ZOOKEEPER_HOME}"]

WORKDIR ${ZOOKEEPER_HOME}

EXPOSE 2181 2888 3888

ENTRYPOINT ["entrypoint-zk.sh"]

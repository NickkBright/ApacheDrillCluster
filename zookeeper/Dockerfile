FROM alt:p8

ENV ZOOKEEPER_HOME		/opt/servers/zookeeper/zookeeper-3.4.13

ENV PATH			$PATH:${ZOOKEEPER_HOME}/bin

RUN \
	mkdir /opt/servers && mkdir /opt/servers/zookeeper && \
	apt-get update && \
	apt-get install -y wget tar && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \  
	wget "${mirror_url}zookeeper/current/zookeeper-3.4.12.tar.gz" && \
	tar -xzf zookeeper-3.4.12.tar.gz && \
	mv -T zookeeper-3.4.12 /opt/servers/zookeeper/

COPY bin/Entrypoint-zk.sh	/usr/local/bin/

VOLUME ["${ZOOKEEPER_HOME}"]

WORKDIR ${ZOOKEEPER_HOME}

EXPOSE 2181 2888 3888

ENTRYPOINT ["entrypoint-zk.sh"]

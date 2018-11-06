FROM alt:p8

ARG cluster_id
ARG quorum
ARG hdfs_server

ENV DRILL_HOME		/opt/servers/drill
ENV DRILL_CONF		/opt/servers/drill/conf
ENV JAVA_HOME		/usr/lib/jvm/java

ENV PATH		$PATH:${DRILL_HOME}/bin:${JAVA_HOME}/bin

#intalling necessary packages

RUN	apt-get update && \
	apt-get install -y tar which wget java-1.8.0-openjdk-devel

#downloading and unpacking

RUN	mkdir -p /opt/servers/drill/ && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \
	wget ${mirror_url}drill/drill-1.14.0/apache-drill-1.14.0.tar.gz && \
	tar -xzf apache-drill-1.14.0.tar.gz && \
	mv -T apache-drill-1.14.0 /opt/servers/drill/

#setting up configuration

RUN	sed -i -e 's/CLUSTER_ID/${cluster_id}/g' ${DRILL_CONF}/drill-override.conf && \
	sed -i -e 's/ZOOKEEPER_QUORUM/${quorum}/g' ${DRILL_CONF}/drill-override.conf && \
	sed -i -e 's/HDFS_SERVER/${hdfs_server}/g' ${DRILL_CONF}/drill-override.conf

WORKDIR ${DRILL_HOME}

COPY ./conf/*		${DRILL_CONF}

EXPOSE 8047

CMD /opt/servers/drill/bin/drillbit.sh start

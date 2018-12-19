#using CentOS linux image

FROM centos:7

#arguments for conf file

ARG cluster_id
ARG quorum
ARG hdfs_server

#necessary environmental variables 

ENV DRILL_HOME		/opt/servers/drill/
ENV DRILL_CONF		/opt/servers/drill/conf/
ENV JAVA_HOME		/usr/lib/jvm/java/

ENV PATH		$PATH:${DRILL_HOME}/bin:${JAVA_HOME}/bin

#intalling necessary packages

RUN	yum update -y && \
	yum install -y tar which gettext wget java-1.8.0-openjdk-devel

#downloading and unpacking

RUN	mkdir -p /opt/servers/drill/ && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \
	wget ${mirror_url}drill/drill-1.14.0/apache-drill-1.14.0.tar.gz && \
	tar -xzf apache-drill-1.14.0.tar.gz && \
	mv -T apache-drill-1.14.0 /opt/servers/drill/

#copying configuration files

COPY ./conf/* ${DRILL_CONF}
COPY ./bin/*  /usr/local/bin/
COPY ./addons/* ${DRILL_HOME}/jars/3rdparty/

#setting up configuration and removing tar.gz

RUN	CLUSTER_ID=$cluster_id HDFS_SERVER=$hdfs_server ZOOKEEPER_QUORUM=$quorum envsubst < /opt/servers/drill/conf/configuration.conf > /opt/servers/drill/conf/drill-override.conf && \
	chmod +x /usr/local/bin/restart.sh && \
	rm -rf /apache-drill-1.14.0.tar.gz

#setting working directory

WORKDIR ${DRILL_HOME}

#exposing port for host

EXPOSE 8047

#starting drill

CMD sleep 20s && /opt/servers/drill/bin/drillbit.sh start && echo 'Drillbit has started...' && sleep infinity

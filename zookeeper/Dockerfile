#using CentOS linux image

FROM centos:7

#arguments for configuration

ARG server_num
ARG quorum

#necessary environment variables

ENV ZOOKEEPER_HOME		/opt/servers/zookeeper
ENV ZOOKEEPER_CONF		${ZOOKEEPER_HOME}/conf

ENV PATH			$PATH:${ZOOKEEPER_HOME}/bin

#installing necessary packages

RUN	yum update -y && \
	yum install -y wget tar java-1.8.0-openjdk-devel

#downloading and unpacking

RUN	mkdir -p /opt/servers/zookeeper/ && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \  
	wget "${mirror_url}zookeeper/current/zookeeper-3.4.12.tar.gz" && \
	tar -xzf zookeeper-3.4.12.tar.gz && \
	mv -T zookeeper-3.4.12 /opt/servers/zookeeper/ 

#copying conf files from host

COPY ./conf/*		${ZOOKEEPER_CONF}/

#inserting conf parameters

RUN	mkdir -p /var/lib/zookeeper && \
	printf $quorum >> ${ZOOKEEPER_CONF}/zoo.cfg && \
	echo $server_num > /var/lib/zookeeper/myid

#setting working directory

WORKDIR ${ZOOKEEPER_HOME}

#exposing ports

EXPOSE 2181 2888 3888

#starting service

CMD /opt/servers/zookeeper/bin/zkServer.sh start && echo 'Zookeeper service started...' && sleep infinity

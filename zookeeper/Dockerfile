FROM alt:p8

ENV ZOOKEEPER_HOME		/opt/servers/zookeeper/zookeeper-3.4.13
ENV ZOOKEEPER_DATA_DIR		/zookeeper
ENV ZOOKEEPER_DATALOG_DIR	/var/log/zookeeper
ENV ZOOKEEPER_CONF_DIR		${ZOOKEEPER_HOME}/bin

ENV PATH			$PATH:${ZOOKEEPER_HOME}

RUN \
	apt-get update
	&& apt-get install -y wget tar \
	&& wget "http://ftp.byfly.by/pub/apache.org/zookeeper/current/zookeeper-3.4.13.tar.gz"\
	&& tar -xzf zookeeper-3.4.13.tar.gz \
	&& mv -T zookeeper-3.4.13 /opt/servers/zookeeper/ \
	&& mkdir ${ZOOKEEPER_DATA_DIR} \
		 ${ZOOKEEPER_DATALOG_DIR}


COPY zoo.cfg	${ZOOKEEPER_CONF_DIR}/

WORKDIR ${ZOOKEEPER_HOME}

EXPOSE 2181 2888 3888

ENTRYPOINT ["entrypoint.sh"]
CMD ["-server","1"]

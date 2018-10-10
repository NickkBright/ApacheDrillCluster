FROM alt:p8

ENV HADOOP_HOME		/opt/servers/hadoop
ENV HADOOP_CONF_DIR	${HADOOP_HOME}/etc/hadoop

ENV $PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

RUN 
	apt-get update && \
	apt install wget tar && \
	wget http://ftp.byfly.by/pub/apache.org/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz && \
	tar -xzf hadoop-2.8.5.tar.gz && \
	mv hadoop-2.8.5 /opt/services/hadoop/ && \
	rm -rf ${HADOOP_CONF_DIR}/hdfs-site.xml

COPY conf/*		${HADOOP_CONF_DIR}
COPY bin/*		/usr/local/bin/

WORKDIR ${HADOOP_HOME}

VOLUME ["/hadoop", "/var/log/hdfs"]

ENTRYPOINT ["Entrypoint-hdfs.sh"]
 

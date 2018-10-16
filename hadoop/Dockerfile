FROM alt:p8

ENV HADOOP_HOME		/opt/servers/hadoop
ENV HADOOP_CONF_DIR	${HADOOP_HOME}/etc/hadoop

ENV $PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

RUN 
	apt-get update && \
	apt install -y open-ssh wget tar && \
	wget http://ftp.byfly.by/pub/apache.org/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz && \
	tar -xzf hadoop-2.8.5.tar.gz && \
	mv hadoop-2.8.5 /opt/services/hadoop/ && \
	ssh-keygen -t rsa -P -f~/.ssh/id_rsa && \
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
	chmod 0600 ~/.ssh/authorized_keys

COPY bin/*		/usr/local/bin/

WORKDIR ${HADOOP_HOME}

VOLUME ["${HADOOP_HOME}"]


ENTRYPOINT ["Entrypoint-hdfs.sh"]
 

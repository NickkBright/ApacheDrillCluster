FROM alt:p8

ENV HADOOP_HOME		/opt/servers/hadoop/hadoop-2.8.5
ENV HADOOP_CONF_DIR	${HADOOP_HOME}/etc/hadoop

ENV PATH		$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

RUN \
	mkdir opt/servers && mkdir opt/servers/hadoop && \ 
	apt-get update && \
	apt-get install -y openssh-server wget tar && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \  
	wget ${mirror_url}hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz && \
	tar -xzf hadoop-2.8.5.tar.gz && \
	mv hadoop-2.8.5 /opt/servers/hadoop/ && \
	ssh-keygen -t rsa -f ~/.ssh/id_rsa -N "" && \
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
	chmod 0600 ~/.ssh/authorized_keys && \
	cd ${HADOOP_HOME} && bin/hdfs namenode -format

COPY bin/*		/usr/local/bin/

WORKDIR ${HADOOP_HOME}

VOLUME ["${HADOOP_HOME}"]


ENTRYPOINT ["Entrypoint-hdfs.sh"]
 

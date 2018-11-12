#using CentOS linux image

FROM centos:7

#necessary environmental variables 

ENV HADOOP_HOME		/opt/servers/hadoop/
ENV HADOOP_CONF_DIR	${HADOOP_HOME}/etc/hadoop/
ENV JAVA_HOME		/usr/lib/jvm/java/

ENV PATH		$PATH:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:{JAVA_HOME}/bin

#installing necessary packages

RUN	yum update -y && \
	yum install -y openssh-server openssh-clients which wget tar java-1.8.0-openjdk-devel
	

#downloading and repacking

RUN	mkdir -p /opt/servers/hadoop/ && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \  
	wget ${mirror_url}hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz && \
	tar -xzf hadoop-2.8.5.tar.gz && \
	mv -T  hadoop-2.8.5 /opt/servers/hadoop/

#copying conf files

COPY ./etc/hadoop/*     /opt/servers/hadoop/etc/hadoop/

#setting up ssh keys and configs
	
RUN	mkdir -p /var/lib/hadoop/dfs/data && \
	mkdir -p /var/lib/hadoop/dfs/name && \
	echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /opt/servers/hadoop/etc/hadoop/hadoop-env.sh && \
	/usr/bin/ssh-keygen -A && \
        /usr/bin/sshd && \
	ssh-keygen -t rsa -f ~/.ssh/id_rsa -N "" && \
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
	chmod 0600 ~/.ssh/authorized_keys && \
	ssh-keyscan localhost, 0.0.0.0 > ~/.ssh/known_hosts && \
	cd ${HADOOP_HOME} && bin/hdfs namenode -format

#setting working directory

WORKDIR ${HADOOP_HOME}

#exposing ports

EXPOSE 8088 9000

#starting hdfs
 
CMD /usr/sbin/sshd && /opt/servers/hadoop/sbin/start-dfs.sh && echo 'HDFS has started...' && sleep infinity

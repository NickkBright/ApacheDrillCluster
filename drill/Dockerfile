FROM alt:p8

ENV DRILL_HOME		/opt/servers/drill

RUN 
	apt-get update && \
	apt install tar wget && \
	wget http://ftp.byfly.by/pub/apache.org/drill/drill-1.14.0/apache-drill-1.14.tar.gz && \
	tar -xzf apache-drill-1.14.0.tar.gz && \
	mv -T apache-drill-1.14.0 /opt/servers/drill/

VOLUME	["${DRILL_HOME}"]

WORKDIR ${DRILL_HOME}

EXPOSE 8047

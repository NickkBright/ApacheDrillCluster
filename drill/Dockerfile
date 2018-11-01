FROM alt:p8

ENV DRILL_HOME		/opt/servers/drill
ENV JAVA_HOME		/usr/lib/jvm/java

ENV PATH		$PATH:${DRILL_HOME}/bin:${JAVA_HOME}/bin

RUN \ 
	mkdir opt/servers && mkdir opt/servers/drill && \
	apt-get update && \
	apt-get install -y tar which wget && \
	apt-get install -y java-1.8.0-openjdk-devel && \
	mirror_url=$( \
        wget -q -O - "http://www.apache.org/dyn/closer.cgi/?as_json=1" \
        | grep "preferred" \
        | sed -n 's#.*"\(http://*[^"]*\)".*#\1#p') && \
	wget ${mirror_url}drill/drill-1.14.0/apache-drill-1.14.0.tar.gz && \
	tar -xzf apache-drill-1.14.0.tar.gz && \
	mv -T apache-drill-1.14.0 /opt/servers/drill/
	

VOLUME	["${DRILL_HOME}"]

WORKDIR ${DRILL_HOME}

EXPOSE 8047

ENTRYPOINT ["Entrypoint-drill.sh"]

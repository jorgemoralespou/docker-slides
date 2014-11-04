FROM fedora

ENV HOME /opt/jboss
ENV JAVA_HOME /usr/lib/jvm/java
ENV WILDFLY_VERSION 8.1.0.Final
ENV JBOSS_HOME /opt/jboss/wildfly

RUN yum -y update && yum -y install xmlstarlet saxon augeas bsdtar unzip java-1.7.0-openjdk-devel && yum clean all \
    && groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss \
    && cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

WORKDIR /opt/jboss
USER jboss

EXPOSE 8080 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

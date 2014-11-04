FROM fedora

RUN yum -y update && yum clean all

RUN yum -y install xmlstarlet saxon augeas bsdtar unzip && yum clean all

RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

ENV HOME /opt/jboss
WORKDIR /opt/jboss

USER jboss

USER root

RUN yum -y install java-1.7.0-openjdk-devel && yum clean all

USER jboss

ENV JAVA_HOME /usr/lib/jvm/java

ENV WILDFLY_VERSION 8.1.0.Final

RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

ENV JBOSS_HOME /opt/jboss/wildfly

EXPOSE 8080 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

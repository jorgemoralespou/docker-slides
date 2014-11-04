FROM fedora

RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss
ENV HOME /opt/jboss
WORKDIR /opt/jboss
USER jboss

ENV WILDFLY_VERSION 8.1.0.Final
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz -o /tmp/wildfly-$WILDFLY_VERSION.tar.gz && tar -xvzf /tmp/wildfly-$WILDFLY_VERSION.tar.gz && rm /tmp/wildfly-$WILDFLY_VERSION.tar.gz && mv $HOME/wildfly-$WILDFLY_VERSION $HOME/wildfly

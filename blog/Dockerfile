FROM tomcat:9-jre8-slim

# tomcat-9.0.8
# jre-1.8.0

RUN set -x \
  && echo "* soft nofile 65535" >> /etc/security/limits.conf \
  && echo "* hard nofile 65535" >> /etc/security/limits.conf \
  && echo "@root        soft    nproc           65535" >> /etc/security/limits.conf \
  && echo "@root        hard    nproc           65535" >> /etc/security/limits.conf \
  && ulimit -SH 65535 \
  && rm -rf /usr/local/tomcat/webapps/* \
  && yum clean all \
  && rm -rf /var/cache/yum \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ADD solo-2.8.0.tar.gz webapps/

COPY latke.properties webapps/solo/WEB-INF/classes/latke.properties
COPY local.properties webapps/solo/WEB-INF/classes/local.properties

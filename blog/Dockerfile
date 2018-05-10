FROM registry.cn-shenzhen.aliyuncs.com/zxzd/centos7

# tomcat-9.0.8
# jre-1.8.0

RUN set -x \
  && yum install -y java-1.8.0-openjdk \
  && curl -L -O "http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.tar.gz" \
  && tar xf apache-tomcat-9.0.8.tar.gz -C /usr/local/ \
  && mv /usr/local/apache-tomcat-9.0.8 /usr/local/tomcat/ \
  && rm -f apache-tomcat-9.0.8.tar.gz \
  && rm -rf /usr/local/tomcat/webapps/* \
  && yum clean all \
  && rm -rf /var/cache/yum/

ADD solo-2.8.0.tar.gz webapps/

COPY latke.properties webapps/solo/WEB-INF/classes/latke.properties
COPY local.properties webapps/solo/WEB-INF/classes/local.properties

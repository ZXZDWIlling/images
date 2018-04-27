FROM tomcat:9-jre8-slim

RUN rm -rf webapps/*

ADD solo-2.8.0.tar.gz webapps/

COPY latke.properties webapps/solo/WEB-INF/classes/latke.properties
COPY local.properties webapps/solo/WEB-INF/classes/local.properties

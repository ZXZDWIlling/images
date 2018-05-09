From oraclelinux:7-slim

COPY entrypoint.sh /
COPY filebeat.yml /etc/filebeat/conf.d/

RUN set -x \
  && chmod 700 /entrypoint.sh \
  && curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.9-x86_64.rpm \
  && rpm -ih filebeat-5.6.9-x86_64.rpm \
  && rm -f filebeat-5.6.9-x86_64.rpm \
  && yum clean all

ENTRYPOINT ["/entrypoint.sh"]
CMD filebeat.sh -e -c /etc/filebeat/conf.d/filebeat.yml

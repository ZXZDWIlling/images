FROM scratch
ADD centos-7-docker.tar.xz /

RUN set -x \
  && echo "* soft nofile 65535" >> /etc/security/limits.conf \
  && echo "* hard nofile 65535" >> /etc/security/limits.conf \
  && echo "@root        soft    nproc           65535" >> /etc/security/limits.conf \
  && echo "@root        hard    nproc           65535" >> /etc/security/limits.conf \
  && ulimit -SH 65535 \
  && echo "NETWORKING=yes" > /etc/sysconfig/network \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  
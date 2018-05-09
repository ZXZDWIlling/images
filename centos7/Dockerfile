FROM scratch
ADD centos-7-docker.tar.xz /

RUN set -x \
  && echo "* soft nofile 655350" >> /etc/security/limits.conf \
  && echo "* hard nofile 655350" >> /etc/security/limits.conf \
  && echo "@root        soft    nproc           655350" >> /etc/security/limits.conf \
  && echo "@root        hard    nproc           655350" >> /etc/security/limits.conf \
  && echo "NETWORKING=yes" > /etc/sysconfig/network \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  
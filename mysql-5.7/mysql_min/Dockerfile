FROM mysql/mysql-server:5.7

#### default vars
# MYSQL_ROOT_PASSWORD=123456
# MYSQL_DATABASE=solo
# MYSQL_USER=zxzdwilling
# MYSQL_USER_PASSWORD=123456
# MYSQL_GUEST=guest
# MYSQL_GUEST_PASSWORD=123456

USER 0

COPY entrypoint /entrypoint
COPY mysql-init.sh /mysql-init
COPY run-mysqld.sh /usr/bin/run-mysqld
COPY my.cnf /tmp/my.cnf

RUN set -x \
  && chmod +x /entrypoint && chmod +x /mysql-init && chmod +x /usr/bin/run-mysqld \
  && yum clean all \
  && rm -f /etc/my.cnf && mv /tmp/my.cnf /etc/ \
  && rm -f /entrypoint.sh

VOLUME ["/var/lib/mysql"]
ENTRYPOINT ["/entrypoint"]
CMD ["run-mysqld"]
EXPOSE 3306

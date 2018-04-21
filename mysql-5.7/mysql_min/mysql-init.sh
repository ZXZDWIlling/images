#! /bin/bash

set -x

#### default vars
# MYSQL_ROOT_PASSWORD=123456
# MYSQL_DATABASE=solo
# MYSQL_USER=zxzdwilling
# MYSQL_USER_PASSWORD=123456
# MYSQL_GUEST=guest
# MYSQL_GUEST_PASSWORD=123456


#### init mysql
rm -rf /var/lib/mysql/* \
  && mysqld --initialize \
  && mysqld --user=mysql --explicit_defaults_for_timestamp & >/dev/null 2>&1 \
  && while [ ! -e /var/lib/mysql/mysql.sock ]; do sleep 1; done && echo "install successful" && \


#rm -rf /var/lib/mysql/* \
  #&& mysql_install_db --user=mysql --datadir=/var/lib/mysql \
  #&& mysqld & >/dev/null 2>&1 \
  #&& while [ ! -e /var/lib/mysql/mysql.sock ]; do sleep 1; done \
  #&& while [ ! -e /root/.mysql_secret ]; do sleep 1; done && echo "install successful" \


#### set root
MYSQLD_LOG_FILE=/var/log/mysqld.log
if [ -z $MYSQL_ROOT_PASSWORD ];then
  MYSQL_ROOT_PASSWORD=123456
fi
OLD_PW=`grep password $MYSQLD_LOG_FILE | sed -n 's#^.*: \(.*\)$#\1#gp'` \
  && mysqladmin -uroot -p"$OLD_PW" password "$MYSQL_ROOT_PASSWORD" && \
#OLD_PW=`awk 'NR==2{ print $1 }' /root/.mysql_secret` \
#  && mysqladmin -uroot -p"$OLD_PW" password "$MYSQL_ROOT_PASSWORD" && rm -f /root/.mysql_secret && \


#### create database
if [ -z $MYSQL_DATABASE ];then
  MYSQL_DATABASE=solo
fi
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "create database $MYSQL_DATABASE;"  && \

#### init user
if [ -z $MYSQL_USER ];then
  MYSQL_USER=zxzdwilling
fi

if [ -z $MYSQL_USER_PASSWORD ];then
  MYSQL_USER_PASSWORD=123456
fi
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e \
  "grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%' identified by '$MYSQL_USER_PASSWORD';" && \


#### init guest
if [ -z $MYSQL_GUEST ];then
  MYSQL_GUEST=guest
fi

if [ -z $MYSQL_GUEST_PASSWORD ];then
  MYSQL_GUEST_PASSWORD=123456
fi
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e \
  "create user '$MYSQL_GUEST'@'%' identified by '$MYSQL_GUEST_PASSWORD'; grant select on $MYSQL_DATABASE.* to '$MYSQL_GUEST'@'%';"


#### 
mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown

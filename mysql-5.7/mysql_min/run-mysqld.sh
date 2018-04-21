#!/bin/bash
if [ -e /mysql-init ];then
  /mysql-init >/dev/null 2>&1 && rm -f /mysql-init && mysqld
else
  mysqld
fi

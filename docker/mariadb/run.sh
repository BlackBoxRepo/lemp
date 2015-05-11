#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=mysql > /dev/null

/usr/sbin/mysqld --user mysql --bootstrap << SQL
    FLUSH PRIVILEGES;

    DROP DATABASE IF EXISTS test;

    CREATE DATABASE IF NOT EXISTS $DB;
    USE $DB;

    GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.%', 'root'@'10.%' WITH GRANT OPTION;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE ON $DB.* TO '$USER'@'172.%' IDENTIFIED BY '$PASSWORD';

    FLUSH PRIVILEGES;
SQL

/usr/bin/mysqld_safe --user mysql

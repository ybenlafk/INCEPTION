#!/bin/bash

service mysql start

sleep 5

# Secure the MariaDB installation
mysql -e "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';"
mysql -e "DELETE FROM mysql.user WHERE User='';"
mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mysql -e "DROP DATABASE IF EXISTS test;"
mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE IF NOT \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY \`${MYSQL_PASSWORD}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY \`${MYSQL_PASSWORD}\`;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

service mysql restart
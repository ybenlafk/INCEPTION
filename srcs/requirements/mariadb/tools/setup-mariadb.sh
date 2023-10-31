#!/bin/bash

# Start the MariaDB service (if not running already)
service mysql start

# Wait for MariaDB service to start (sleep might not be necessary in some cases)
# Add a delay if required for service initialization
sleep 5

# Create the database and user
echo "UPDATE mysql.user SET Host='%' WHERE User='root';" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql -u root
# Update the root password and grant privileges
echo "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root -p"$MYSQL_ROOT_PASSWORD"
echo "INSERT INTO mysql.user (Host, User, ssl_cipher, x509_issuer,x509_subject,authentication_string) VALUES ('127.0.0.1', 'root', '', '', '', '');" | mysql -u root
echo "INSERT INTO mysql.user (Host, User, ssl_cipher, x509_issuer,x509_subject,authentication_string) VALUES ('::1', 'root', '', '', '', '');" | mysql -u root

# Stop the MariaDB service (you might not need to stop the service in a Docker environment)
service mysql stop

# Start the MariaDB service in the foreground (let Docker manage the service)
exec mysqld_safe --user=mysql --console

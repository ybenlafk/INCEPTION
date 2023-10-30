#!/bin/bash

# Start the MariaDB service (if not running already)
service mysql start

# Wait for MariaDB service to start (sleep might not be necessary in some cases)
# Add a delay if required for service initialization
sleep 5

# Update the root password and grant privileges

# Create the database and user
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root

# Stop the MariaDB service (you might not need to stop the service in a Docker environment)
service mysql stop

# Start the MariaDB service in the foreground (let Docker manage the service)
exec mysqld_safe --user=mysql --console

# exec "tail -f /dev/null"

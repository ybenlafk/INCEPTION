#!/bin/bash

cd /var/www/html

# Download and install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress Core
wp core download --allow-root

# Move the sample configuration file to wp-config.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# Set up the database configuration in wp-config.php
sed -i -r "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
sed -i -r "s/username_here/$MYSQL_USER/1" wp-config.php
sed -i -r "s/password_here/$MYSQL_PASSWORD/1" wp-config.php

sleep 20
# Install WordPress
wp core install --url=$DOMAIN_NAME/ --title=$TITLE --admin_user=$ADMINE_USER --admin_password=$ADMINE_PW --skip-email --allow-root

# Create an additional user
wp user create $USER --role=author --user_pass=$PWD --allow-root

# Configure PHP-FPM
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php

# Start PHP-FPM service
/usr/sbin/php-fpm7.3 -F
#!/bin/sh

# Check if wp-config.php exists
if [ -f ./wp-config.php ]; then
    echo "WordPress already downloaded"
else
    # Download WordPress and its configuration files
    echo "Downloading WordPress..."
    wget -q https://wordpress.org/wordpress-5.8.tar.gz 
    tar -xzvf wordpress-5.8.tar.gz
    mv wordpress/* .
    rm -rf wordpress-5.8.tar.gz wordpress
    
    # Import environment variables in the config file
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

    cp wp-config-sample.php wp-config.php

    echo "WordPress installation and configuration completed."

    # Add two users (including one admin)
    if [ -f ./wp-config.php ]; then
        echo "WordPress already installed. Adding users..."

        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

        chmod +x wp-cli.phar 

        mv wp-cli.phar /usr/local/bin/wp

        wp core install --url="localhost" --title=$TITLE --admin_user="$ADMINE_USER" --admin_password="$ADMINE_PWD" --admin_email="$ADMINE_EMAIL" --allow-root
        
        wp user create "$USER" "$EMAIL" --user_pass="$PWD" --allow-root
        
        echo "Two users have been created (one admin)."
    else
        echo "WordPress not found. Installation failed."
    fi
fi

exec "$@"

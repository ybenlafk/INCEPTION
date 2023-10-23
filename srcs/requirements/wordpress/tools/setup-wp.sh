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
    sed -i "s/username_here/ybenlafk/g" wp-config-sample.php
    sed -i "s/password_here/1234/g" wp-config-sample.php
    sed -i "s/localhost/mariadb/g" wp-config-sample.php
    sed -i "s/database_name_here/wordpress/g" wp-config-sample.php

    cp wp-config-sample.php wp-config.php

    echo "WordPress installation and configuration completed."
fi

exec "$@"
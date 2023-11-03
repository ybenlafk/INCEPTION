FROM  debian:buster

# update & upgrade apt
RUN apt update && apt upgrade -y && apt-get install -y \
    curl \
    wget \
    php \
    php-fpm \
    php-mysql

RUN mkdir /var/www \
    && mkdir /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && mkdir -p /run/php

# copy php config file
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html
COPY ./tools/setup-wp.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

EXPOSE 9000

CMD ["/tmp/wordpress.sh"]
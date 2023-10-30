FROM  debian:buster

# update & upgrade apt
RUN apt update && apt upgrade -y && apt-get install -y \
    wget \
    php \
    php-fpm \
    php-mysql

RUN mkdir /run/php

# copy php config file
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html
COPY ./tools/setup-wp.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh
ENTRYPOINT ["/tmp/wordpress.sh"]


EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
FROM  debian:buster

# update & upgrade apt
RUN apt update && apt upgrade -y && apt-get install -y \
    curl \
    php-fpm \
    php-mysql

COPY ./tools/setup-wp.sh /

RUN chmod +x /setup-wp.sh

# COPY ./tools/wp-config.php /

EXPOSE 9000

CMD [ "/setup-wp.sh" ]
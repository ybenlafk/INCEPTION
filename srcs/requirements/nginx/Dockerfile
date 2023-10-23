FROM   debian:buster

RUN apt update && apt upgrade \
    && apt install -y nginx vim curl \
    && mkdir -p /etc/nginx/ssl \
    && apt-get install -y openssl \
    && openssl req -x509 -nodes -out /etc/nginx/ssl/server.crt -keyout /etc/nginx/ssl/server.key -subj "/C=MA/ST=MS/L=Safi/O=42/OU=42/CN=ybenlafk.42.fr/UID=ybenlafk" \
    && mkdir -p /var/run/nginx \
    && chmod 777 /var/www/html \
    && chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
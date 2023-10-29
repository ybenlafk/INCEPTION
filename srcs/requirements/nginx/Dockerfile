FROM   debian:buster

RUN apt update && apt upgrade 

RUN apt install -y nginx vim curl 

RUN mkdir -p /etc/nginx/ssl 

RUN apt-get install -y openssl 

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=MS/L=Safi/O=42/OU=42/CN=ybenlafk.42.fr/UID=ybenlafk" 

RUN mkdir -p /var/run/nginx 

RUN chmod 777 /var/www/html 

RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
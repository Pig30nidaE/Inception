FROM debian:bullseye

EXPOSE 9000

RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get -y install \
php7.4 \
php-fpm \
php-cli \
wget \
curl \
php-mysql \
php-mbstring \
php-xml

RUN mkdir /var/www/
WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz

RUN mv wordpress/* /var/www

RUN chown -R www-data:www-data /var/www
RUN rm -r wordpress/
RUN rm latest.tar.gz

RUN mv /var/www/wp-config-sample.php /var/www/wp-config.php

COPY ./conf/wp-config.php /var/www
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/wordpress_init.sh /

RUN chmod +x /wordpress_init.sh
ENTRYPOINT [ "sh", "/wordpress_init.sh" ]
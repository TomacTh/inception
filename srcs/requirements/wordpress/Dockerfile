FROM debian:buster

RUN apt-get update -y && \
	apt-get install php-fpm php-mysql \
	php-xml php-mbstring php-zip php-gd php-pear php-gettext php-cgi php-curl php-imagick -y

RUN service php7.3-fpm start 

EXPOSE 9000 3306

RUN echo "listen = 9000\nclear_env = no" >> /etc/php/7.3/fpm/pool.d/www.conf


ENTRYPOINT ["php-fpm7.3", "-F"]


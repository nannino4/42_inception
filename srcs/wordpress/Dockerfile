FROM debian:buster

RUN		apt-get update && apt-get install -y\
		wget \
		mariadb-client \
		php7.3-fpm php7.3-bcmath php7.3-curl php7.3-gd php7.3-imagick php7.3-mbstring php7.3-mysql php7.3-soap php7.3-xml php7.3-zip \
		dumb-init

RUN		mkdir -p /var/www/gcefalo &&\
		chown -R www-data var/www/gcefalo && \
		chmod -R 755 var/www/gcefalo && \
		wget https://wordpress.org/latest.tar.gz && \
		tar -xzf latest.tar.gz && \
		mv wordpress /var/www/gcefalo/wordpress && \
		rm -rf latest.tar.gz

RUN		sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini && \
		mkdir -p /run/php && \
		chown -R www-data /run/php && \
		chmod -R 755 /run/php

COPY	./wp-config.php ./var/www/gcefalo/wordpress
COPY	./php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY	./www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT	[ "dumb-init", "--" ]
CMD			[ "php-fpm7.3", "-F" ]

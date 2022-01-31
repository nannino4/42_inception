FROM	debian:buster

RUN		apt-get update && apt-get install -y \
		nginx \
		openssl \
		dumb-init

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout	/etc/ssl/private/gcefalo.key \
		-out	/etc/ssl/certs/gcefalo.crt \
		-subj	"/Country=Italy/Province=Rome/School=42Roma/Login=gcefalo"

RUN		mkdir -p /var/www/gcefalo && \
		chown -R www-data:www-data var/www/gcefalo && \
		chmod -R 755 var/www/gcefalo

COPY	./gcefalo.conf /etc/nginx/conf.d/gcefalo.conf
COPY	./gcefalo.conf /etc/nginx/sites-available/default

EXPOSE	443

ENTRYPOINT	[ "dumb-init", "--" ]
CMD 		[ "nginx", "-g", "daemon off;" ]

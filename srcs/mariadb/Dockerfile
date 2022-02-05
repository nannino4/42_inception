FROM debian:buster

RUN 	apt-get update \
        && apt-get -y install apt-utils mariadb-server mariadb-client dumb-init \
        && rm -rf /var/lib/mysql \
        && mkdir -p /var/lib/mysql /run/mysqld \
        && chown -R mysql:mysql /var/lib/mysql  /run/mysqld \
        && chmod 777 /var/run/mysqld

COPY	./start.sh /
RUN     chmod 755 /start.sh

ENTRYPOINT	[ "dumb-init", "--" ]
CMD		[ "./start.sh" ]

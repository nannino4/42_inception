FROM debian:buster

RUN 	apt-get update \
        && apt-get -y install apt-utils mariadb-server mariadb-client \
        && rm -rf /var/lib/mysql \
        && mkdir -p /var/lib/mysql /run/mysqld \
        && chown -R mysql:mysql /var/lib/mysql  /run/mysqld \
        && chmod 777 /var/run/mysqld

COPY	./start.sh /
# COPY	./my.cnf /etc/mysql/my.cnf
# COPY	./50-mysqld_safe.cnf /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf
# COPY	./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# ENV MARIADB_ROOT_PSW=iamroot123
# ENV WP_DB_NAME=wordpress_db
# ENV WP_DB_ADMIN=wp_user0
# ENV WP_DB_ADMIN_PSW=wp_user0_psw

# ENTRYPOINT	[ "dumb-init", "--" ]
CMD			[ "./start.sh" ]

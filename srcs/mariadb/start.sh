#!/bin/sh

echo "\n[i] Set Configuration for Mysql\n"
cat <<-EOF > /etc/mysql/my.cnf
	[mysqld]
	user = root
	port = 3306
	datadir = /var/lib/mysql
	bind-address = 0.0.0.0
	skip-bind-address
	skip-networking = false
	pid-file = /run/mysqld/mysqld.pid
	socket = /run/mysqld/mysqld.sock
EOF

if [ ! -d $DATADIR/mysql ]; then #check if database is not already created
	echo "\n[i] Initialization of database\n"
	mysql_install_db --datadir=$DATADIR > /dev/null

	echo "\n[i] start mysqld_safe\n"
	mysqld_safe &

	sleep 2

	echo "\n[i] Delete useless stuff\n[i] Set password for root\n[i] Create database\n[i] Create user\n"
	#connecte as root without password then set password at root 
	mysql -u  root --skip-password <<- EOF 
		USE mysql;
		FLUSH PRIVILEGES;
		DELETE FROM	mysql.user WHERE User='';
		DROP DATABASE test;
		DELETE FROM mysql.db WHERE Db='test';
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
		
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PSW';

		CREATE DATABASE IF NOT EXISTS $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
		CREATE USER IF NOT EXISTS '$WP_DB_ADMIN'@'%' IDENTIFIED by '$WP_DB_ADMIN_PSW';
		GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_ADMIN'@'%';
		FLUSH PRIVILEGES;
	EOF
	sleep 2

	echo "[i] Shut down the server with mysqladmin"
	mysqladmin -uroot -p"$MARIADB_ROOT_PSW" shutdown
	# echo "[i] database restarting\n"
	sleep 2
else
	echo "\n[i] Skipping initializatio cause Mysql database is already created"
fi


# echo "\n[i] Service mysql start\n"
# service mysql start
# sleep 2

# echo "\n[i] Change root psw\n"
# mysql -uroot <<EOF
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PSW';
# EOF

# echo "\n[i] Create database and user\n"
# mysql -uroot -p$MARIADB_ROOT_PSW <<EOF
# CREATE DATABASE $WP_DB_NAME;\
# CREATE USER '$WP_DB_ADMIN'@'%' IDENTIFIED by '$WP_DB_ADMIN_PSW';\
# GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_ADMIN'@'%' WITH GRANT OPTION;\
# FLUSH PRIVILEGES;
# EOF

# echo "\n[i] mysqladmin shutdown\n"
# mysqladmin -uroot -p$MARIADB_ROOT_PSW shutdown
# sleep 2

sleep 5

echo "[i] Starting mariadb server\n"
exec mysqld -u root

#!/bin/sh

echo "\n- Set Configuration for Mysql\n"
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

if [ ! -d $DATADIR/mysql ]; then
	echo "\n- Initialization of database\n"
	mysql_install_db --datadir=$DATADIR > /dev/null

	echo "\n- start mysqld_safe\n"
	mysqld_safe &

	sleep 2

	echo "\n- Delete useless stuff\n- Set password for root\n- Create database\n- Create user\n"
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

	echo "- Shut down the server with mysqladmin"
	mysqladmin -uroot -p"$MARIADB_ROOT_PSW" shutdown
	# echo "- database restarting\n"
	sleep 2
else
	echo "\n- Skipping initialization: mysql database already initialized"
fi

sleep 5

echo "- Starting mariadb server\n"
exec mysqld -u root

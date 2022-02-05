
if [ ! -d /var/www/gcefalo/wordpress ]; then
    echo "\n- downloading wordpress\n"
    wget https://wordpress.org/latest.tar.gz >/dev/null 2>/dev/null
    echo "\n- wordpress has been downloaded\n"
    tar -xzf latest.tar.gz
    mv /wordpress /var/www/gcefalo/wordpress
    rm -rf latest.tar.gz
else
    echo "\n- skipping wordpress download: wordpress already installed\n"
fi

mv /wp-config.php	/var/www/gcefalo/wordpress
mv /php-fpm.conf	/etc/php/7.3/fpm/php-fpm.conf
mv /www.conf		/etc/php/7.3/fpm/pool.d/www.conf

exec php-fpm7.3 -F

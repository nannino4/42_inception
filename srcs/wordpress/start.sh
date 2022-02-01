echo "\n[ii] downloading wordpress\n"
wget https://wordpress.org/latest.tar.gz >/dev/null 2>/dev/null
echo "\n[ii] wordpress has been downloaded\n"
tar -xzf latest.tar.gz
rm -rf /var/www/gcefalo/wordpress
mv /wordpress /var/www/gcefalo/wordpress
rm -rf latest.tar.gz

mv /wp-config.php	/var/www/gcefalo/wordpress
mv /php-fpm.conf	/etc/php/7.3/fpm/php-fpm.conf
mv /www.conf		/etc/php/7.3/fpm/pool.d/www.conf

exec php-fpm7.3 -F

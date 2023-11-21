#!/bin/bash

sleep 10 #make sure the db is launched
if [ ! -f "/var/www/wordpress/wp-config.php " ];
then
	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USR_NAME \
						--dbpass=$DB_USR_PSWRD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
fi


/usr/sbin/php-fpm${PHP_VERSION} -F
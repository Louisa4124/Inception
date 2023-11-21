#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php " ];
then
	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USR_NAME \
						--dbpass=$DB_USR_PSWRD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
else
	echo "end"
fi

/usr/sbin/php-fpm7.4 -F

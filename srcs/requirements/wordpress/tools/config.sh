#!/bin/bash

sleep 10 #make sure the db is launched
if [ ! -f "/var/www/wordpress/wp-config.php " ];
then
	wp core download --allow-root --path="/var/www/html/wordpress" \
	&& wp config create	--dbname=$DB_NAME \
						--dbuser=$DB_USR_NAME \
						--dbpass=$DB_USR_PSWRD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
else
	echo "the end"
fi
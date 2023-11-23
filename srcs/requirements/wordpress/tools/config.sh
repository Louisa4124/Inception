#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ];
then
	wp core download --allow-root --path="/var/www/wordpress" \
	&& wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USR_NAME \
						--dbpass=$DB_USR_PSWRD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress' \
	&& wp core install --allow-root --path="/var/www/wordpress" --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWRD --admin_email=$WP_ADMIN_EMAIL --skip-email \
	&& wp plugin update --allow-root --path="/var/www/wordpress" --all \
	&& wp theme install --allow-root --path="/var/www/wordpress" https://downloads.wordpress.org/theme/ayageek.1.4.3.zip --activate \
	&& wp user create --allow-root --path="/var/www/wordpress" $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PSWRD \
	&& chown www-data:www-data /var/www/wordpress/wp-content/uploads -R 
else
	echo "Already configured"
fi



exec "$@"
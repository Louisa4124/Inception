#!/bin/bash

wp core download --allow-root --path="/var/www/html" \
&& wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$DB_USR_NAME \
					--dbpass=$DB_USR_PSWRD \
					--dbhost=mariadb:3306 --path='/var/www/html' \
&& wp core install --allow-root --path="/var/www/html" --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PSWRD --admin_email=$WP_ADMIN_EMAIL --skip-email \
&& wp plugin update --allow-root --path="/var/www/html" --all \
&& wp theme install --allow-root --path="/var/www/html" https://public-api.html.com/rest/v1/themes/download/organizer.zip  --activate \
&& wp user create --allow-root --path="/var/www/html" $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PSWRD \
&& chown www-data:www-data /var/www/html/wp-content/uploads -R 

exec "$@"
FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php php7.4-fpm php-mysql mariadb-client

ADD https://www.adminer.org/#download /var/www/wordpress/adminer.php

RUN chmod +r /var/www/wordpress/adminer.php

RUN service php7.4-fpm start

ENTRYPOINT ["/usr/sbin/php-fpm7.4", "-F"]

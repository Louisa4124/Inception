FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php php7.4-fpm php-mysql mariadb-client

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/wordpress/adminer.php

RUN chmod +r /var/www/wordpress/adminer.php

RUN service php7.4-fpm start

ENTRYPOINT ["/usr/sbin/php-fpm7.4", "-F"]

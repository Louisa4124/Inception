FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-cache search wget && apt info wget && apt-get install -y wget

RUN apt-get install -y unzip php php7.4-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4.1-fr_FR.zip -P /var/www 
WORKDIR /var/www
RUN unzip wordpress-6.4.1-fr_FR.zip
RUN rm wordpress-6.4.1-fr_FR.zip

RUN chown -R root:root /var/www/wordpress

RUN rm -rf /var/www/wordpress

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/config.sh /tmp/
RUN chmod 755 /tmp/config.sh

RUN service php7.4-fpm start

EXPOSE 9000

ENTRYPOINT ["/tmp/config.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]

FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-cache search wget && apt info wget && apt-get install -y wget

RUN apt-get install -y php php7.4-fpm php-mysql mariadb-client

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/config.sh /tmp/
RUN chmod 755 /tmp/config.sh

WORKDIR /var/www/wordpress
RUN rm -rf *
RUN service php7.4-fpm start 

EXPOSE 9000

ENTRYPOINT ["/tmp/config.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]

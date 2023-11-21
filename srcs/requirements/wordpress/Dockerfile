FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt-cache search wget && apt info wget && apt-get install -y wget

RUN apt-get install -y php php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4.1-fr_FR.tar.gz -P /var/www 
WORKDIR /var/www
RUN tar -xzf wordpress-6.4.1-fr_FR.tar.gz
RUN rm wordpress-6.4.1-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/w

COPY /tools/config.sh /tmp/
RUN chmod 755 /tmp/config.sh

ENTRYPOINT ["sh", "/tmp/config.sh"]

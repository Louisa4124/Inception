FROM debian:11
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y openssl
ADD tools/loulou.conf /etc/nginx/sites-available/loulou.conf
RUN ln -s /etc/nginx/sites-available/loulou.conf /etc/nginx/sites-enabled/loulou.conf

# root
RUN chmod 755 /var/www/html
# user
RUN chown -R www-data:www-data /var/www/html

# to generate the certificate directly inside the image -> false
# RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/loulou.pem -out /etc/ssl/loulou.cert -sha256 -days 3650 -nodes -subj "/C=FR/ST=France/L=Lyon/O=42/CN=loulou"

ADD tools/loulou.cert /etc/ssl/loulou.cert
ADD tools/loulou.pem /etc/ssl/loulou.pem

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]


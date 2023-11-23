FROM debian:11

RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y mariadb-server

ARG DB_USR_NAME
ARG DB_USR_PSWRD
ARG DB_ROOT_PSWRD
ARG DB_NAME

RUN service mariadb start && mariadb -u root -e "CREATE OR REPLACE database ${DB_NAME};"
RUN service mariadb start && mariadb -u root -e "CREATE USER ${DB_USR_NAME} IDENTIFIED BY '${DB_USR_PSWRD}';"
RUN service mariadb start && mariadb -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* to ${DB_USR_NAME};"
RUN service mariadb start && mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PSWRD}';"

EXPOSE 3306

ENTRYPOINT ["mysqld", "--bind-address=0.0.0.0"]

FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./tools/mariadb.sql /var/www/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start && mysql -u root < /var/www/mariadb.sql

CMD ["mysqld_safe"]
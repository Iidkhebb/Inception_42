FROM debian:buster

RUN apt-get update
RUN apt-get install -y php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

COPY ./tools/setup.sh /var/www/
COPY  ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /var/www/setup.sh

ENTRYPOINT [ "bash", "/var/www/setup.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
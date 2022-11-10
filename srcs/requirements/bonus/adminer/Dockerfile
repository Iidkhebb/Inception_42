FROm debian:buster

RUN apt update
RUN apt-get install -y php7.3 php-mysqli php-fpm

EXPOSE 8080
COPY ./tools/index.php /var/www/html/index.php

WORKDIR /var/www/html
CMD ["php", "-S", "0.0.0.0:8080"]
FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl 
RUN apt install -y python

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/default
COPY ./tools/ngnix_setup.py /var/www/

RUN chmod +x /var/www/ngnix_setup.py
RUN python /var/www/ngnix_setup.py

CMD ["nginx", "-g", "daemon off;"]


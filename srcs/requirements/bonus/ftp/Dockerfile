FROM debian:buster

RUN apt-get update
RUN apt install -y vsftpd

EXPOSE 21
EXPOSE 21000-21010

RUN useradd -ms /bin/bash iidkhebb
COPY ./conf/vsftpd.conf /www/var/vsftpd.conf
RUN chmod +x /www/var/vsftpd.conf
COPY ./tools/setup.sh /var/www/setup.sh


CMD [ "bash", "/var/www/setup.sh" ]

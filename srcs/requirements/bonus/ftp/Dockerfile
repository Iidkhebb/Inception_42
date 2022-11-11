FROM debian:buster

RUN apt-get update
RUN apt install -y vsftpd

EXPOSE 21
EXPOSE 21000-21010

RUN useradd -ms /bin/bash iidkhebb
COPY ./conf/vsftpd.conf /var/www/vsftpd.conf

COPY ./tools/setup.sh /var/www/setup.sh

ENTRYPOINT [ "bash", "/var/www/setup.sh" ]

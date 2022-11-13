FROM debian:buster

RUN apt update
RUN apt install -y python3-pip
EXPOSE 5050
COPY ./tools/ /var/www/

WORKDIR /var/www
RUN pip3 install -r requirements.txt
CMD [ "python3", "main.py" ]
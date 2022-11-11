FROM python:3.8-slim-buster

# RUN apt update
EXPOSE 5050
COPY ./tools/ /var/www/

WORKDIR /var/www
RUN pip install -r requirements.txt
CMD [ "python", "main.py" ]
FROM debian:buster

RUN apt-get update
RUN apt install -y python3-pip
EXPOSE 8000

COPY ./frontend /var/www/frontend
COPY requirements.txt /var/www/frontend

RUN pip3 install -r /var/www/frontend/requirements.txt

ENV PYTHONUNBUFFERED=1
WORKDIR /var/www/frontend/
CMD ["python3", "/var/www/frontend/manage.py", "runserver", "0.0.0.0:8000"]
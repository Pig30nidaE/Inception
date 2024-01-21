FROM debian:bullseye

EXPOSE 443

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -y install nginx openssl
COPY ./conf/default /etc/nginx/sites-available

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/sanghyol.key -out /etc/ssl/sanghyol.crt \
-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=sanghyol"

RUN chmod 700 /etc/ssl/sanghyol.crt
RUN chmod 700 /etc/ssl/sanghyol.key

ENTRYPOINT ["nginx", "-g", "daemon off;"]
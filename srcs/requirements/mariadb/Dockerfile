FROM debian:bullseye

EXPOSE 3306

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mariadb-server mariadb-client
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/mariadb_init.sh /

RUN chmod +x /mariadb_init.sh

ENTRYPOINT sh /mariadb_init.sh
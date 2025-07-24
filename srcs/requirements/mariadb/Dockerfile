FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /run/mysqld

COPY script.sh .
RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]

CMD ["mysqld"]
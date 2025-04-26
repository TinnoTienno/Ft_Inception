FROM debian:bullseye

RUN apt update -y

RUN apt upgrade -y

RUN apt-get install mariadb-server -y 

RUN mkdir -p /var/run/mysqld && chmod 750 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh /script.sh

RUN  chmod 750 /script.sh

ENTRYPOINT ["/script.sh"]
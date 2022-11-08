FROM debian:buster

EXPOSE 3306


RUN apt-get update -y && \
	apt-get install mariadb-server -y 
RUN service mysql start

COPY my.cnf /etc/mysql/my.cnf



ENTRYPOINT ["mysqld"]


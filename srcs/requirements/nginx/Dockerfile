FROM debian:buster

RUN apt-get -qq -y update
RUN apt-get install -y nginx openssl


#ssl
RUN mkdir etc/nginx/ssl && openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out  /etc/nginx/ssl/inception.pem -keyout etc/nginx/ssl/inception.key -subj "/C=FR/ST=Sud/L=Nice/O=42/OU=42tcharvet/CN=localhost"
COPY ./default /etc/nginx/sites-available

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

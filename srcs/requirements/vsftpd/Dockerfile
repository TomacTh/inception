FROM debian:buster

ARG FTP_USER
ARG FTP_USER_PASSWORD

RUN apt-get -y update && apt-get -y install vsftpd \
    && mkdir -p /var/run/vsftpd/empty && chmod -xw /var/run/vsftpd/empty \
    && useradd -m "${FTP_USER}" && echo "${FTP_USER}:${FTP_USER_PASSWORD}" | chpasswd

COPY ./vsftpd.conf /etc/vstpd.conf

RUN echo "tcharvet" >> /etc/vsftpd.userlist

ENTRYPOINT ["vsftpd"]

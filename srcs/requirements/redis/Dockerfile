FROM debian:buster

RUN apt-get -y update && apt-get -y install redis && echo "maxmemory 100mb" >> /etc/redis/redis.conf
EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode no"]

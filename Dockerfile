FROM ubuntu:20.04
MAINTAINER Natalia_Kalcheva

RUN apt-get update \
  && apt-get install -y nginx php-fpm \ 
  && rm -rf /var/lib/{apt,dpkg,cache,log} \
  && mkdir /run/php-fpm

COPY default /etc/nginx/sites-available/default

VOLUME "/var/www/html"
EXPOSE 80

CMD ["/bin/bash", "-c", "/usr/sbin/nginx -g 'daemon off;' ; php-fpm7.4 -D"]

FROM stackbrew/ubuntu:saucy
 
ENV DEBIAN_FRONTEND noninteractive
 
RUN apt-get update -y
RUN apt-get install -y \
 curl \
 php5-cli php5-json php5-intl php5-curl

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN composer global require 'phpunit/phpunit=4.1.*'

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/.composer/vendor/bin/phpunit"]

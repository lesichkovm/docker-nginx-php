# Use Ubuntu 18.10
FROM ubuntu:18.10

# Update
RUN apt-get -y update
RUN apt-get install --no-install-recommends --no-install-suggests -y curl 

# Install PHP
RUN apt-get -y install php

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

# Install NGINX
RUN apt-get -y install nginx

RUN apt-get -y autoremove
RUN apt-get -y autoclean

# Create project directory
RUN mkdir /web

# Expose the 8080 port
EXPOSE 8080/tcp

CMD ["/bin/sh"]

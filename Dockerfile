# Use Ubuntu 18.10
FROM ubuntu:18.10

# Update
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Install PHP
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends --no-install-suggests install curl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends --no-install-suggests install nano

# Install PHP
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends --no-install-suggests install php
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends --no-install-suggests install php-sqlite3

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

# Install NGINX
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends --no-install-suggests install nginx

RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoremove
RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoclean

# Create project directory
RUN mkdir /web

# Expose the 8080 port
EXPOSE 8080/tcp

CMD ["/bin/sh"]

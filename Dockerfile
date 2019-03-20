# Use Ubuntu 18.10
FROM ubuntu:18.10

# Update
RUN apt-get -y update

# Install PHP
RUN apt-get -y install php

# Install NGINX
RUN apt-get -y install nginx

# Create project directory
RUN mkdir /web

# Expose the 8080 port
EXPOSE 8080/tcp

CMD ["/bin/sh"]

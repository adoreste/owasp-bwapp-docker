FROM tutum/lamp:latest

ENV DEBIAN_FRONTEND noninteractive

# Preparation
RUN rm -fr /app/*
RUN apt-get update
RUN apt-get install -yqq wget unzip php5-curl dnsutils
RUN rm -rf /var/lib/apt/lists/*

# Deploy bWAPP
COPY ./bWAPP_latest.zip /tmp/bwapp.zip
# RUN wget --no-check-certificate -O /tmp/bwapp.zip https://sourceforge.net/projects/bwapp/files/latest/download
RUN unzip /tmp/bwapp.zip -d /tmp/bwapp 
RUN mv /tmp/bwapp/bWAPP/* /app

# Setup
RUN sed -i 's/db_password = "bug"/db_password = ""/g' /app/admin/settings.php
RUN a2enmod include
RUN a2enmod actions
RUN a2enmod cgi
RUN a2enmod cgid
RUN a2enmod dav 
RUN a2enmod dav_fs
COPY ./configs/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./configs/httpd.conf /etc/apache2/conf-enabled/httpd.conf
COPY ./configs/apache2.conf /etc/apache2/apache2.conf
COPY ./configs/crossdomain.xml /var/www/html/crossdomain.xml
COPY ./configs/ClientAccessPolicy.xml /var/www/html/ClientAccessPolicy.xml
RUN chown www-data:www-data -R /app
RUN chmod 777 /app/
RUN chmod 777 /app/passwords/
RUN chmod 777 /app/images/
RUN chmod 777 /app/documents/
RUN chmod 777 /app/logs/


EXPOSE 80 3306
CMD ["/run.sh"]
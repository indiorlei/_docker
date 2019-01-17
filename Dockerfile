FROM ubuntu:14.04

RUN sudo apt-get update

RUN sudo apt-get -y --force-yes install \
	apache2 \
	php5 \
	php5-cli \
	php5-mcrypt \
	php5-json \
	php5-mysql \
	curl \
	php5-curl \
	php5-gd \
	libapache2-mod-auth-mysql \
	php5-mysql

RUN sudo php5enmod mcrypt curl
RUN sudo a2enmod rewrite actions alias

EXPOSE 80

COPY ./apache_config.conf /etc/apache2/sites-available/000-default.conf
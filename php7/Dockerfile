FROM quantumobject/docker-baseimage:15.10
MAINTAINER Naerymdan <vincent.dev@gmail.com>
##
# PHP  : 7.x
##

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# PHP 7.0 Installation
RUN DEBIAN_FRONTEND="noninteractive" apt-get update \
    &&  apt-get install -y \
        build-essential software-properties-commonlanguage-pack-en-base

RUN DEBIAN_FRONTEND="noninteractive" LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    &&  apt-get install -y --force-yes \
	    php-apcu \
		php-cli \
		php-fpm \
		php-mysql \
		php-curl \
		php-gd \
		php-intl \
		php-imap \
		php-mcrypt \
		php-tidy \
		php-json \
		php-mbstring \
		php-zip \
		git \
		python-pygments
		
RUN apt-get upgrade -y --force-yes \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Copy special configs
COPY php.ini         /etc/php/7.0/fpm/php.ini
COPY php-fpm.conf    /etc/php/7.0/fpm/php-fpm.conf
COPY www.conf        /etc/php/7.0/fpm/pool.d/www.conf

#Add the runit conf
COPY service/   /etc/service/
RUN find /etc/service -type f -print -exec chmod +x {} \;

#Copy core local config
COPY local.json   /local.json
RUN chown www-data:www-data /local.json

#Phabricator code folder
RUN mkdir -p /srv && chown www-data:www-data /srv

#File storage folder
RUN mkdir -p /data && chown www-data:www-data /data

#Code storage folder
RUN mkdir -p /repo && chown www-data:www-data /repo

#Set port
EXPOSE 9000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

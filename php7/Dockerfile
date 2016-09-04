FROM alpine:edge
MAINTAINER Naerymdan <vincent.dev@gmail.com>
##
# PHP 7.X

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

#Install PHP7, Pygments and Git
RUN apk upgrade -U \
    && apk --update add php5 php5-fpm php5-apcu php5-cli php5-curl php5-gd php5-json php5-ldap \ 
        php5-mysql php5-openssl php5-xml php5-iconv php5-ctype php5-pcntl php5-posix \
        php5-dom php5-zip php5-pdo php5-pdo_mysql \
         git py-pygments curl mercurial mysql-client \ 
    && rm -rf /var/cache/apk/*

#Copy configs for PHP7 and Phabricator
COPY php-fpm.conf    /etc/php5/php-fpm.conf
COPY local.json      /local.json
COPY entrypoint.sh   /

#Link php7 exec to more standard php name
#Remove useless config
#Phabricator code, File storage, Code storage and missing PATH folder
#Redirect the daemon logs
RUN mkdir -p /srv \
    && mkdir -p /data \
	&& mkdir -p /repo \
	&& mkdir -p /usr/local/sbin \
	&& mkdir -p /var/tmp/phd/log \
    && ln -fs /proc/self/fd/2 /var/tmp/phd/log/daemons.log \
    && chmod +x /entrypoint.sh

#Set port
EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

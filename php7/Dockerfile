FROM alpine:edge
MAINTAINER Naerymdan <vincent.dev@gmail.com>
##
# PHP 7.X

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk upgrade -U \
    && apk --update add \
        php7 \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
		php7-pcntl \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-tidy \
        php7-xml \
        php7-zip \
		git \
		py-pygments \
		autoconf \
		php7-pear \
		php7-dev \
		alpine-sdk

#Add build packages to build/install for apcu && apcu_bc
RUN sed -i "s/exec \$PHP -C -n -q/exec \$PHP -C -q/g" /usr/bin/pecl \
    && printf "\n" | pecl install apcu apcu_bc-beta \
    && echo "extension=apcu.so" > /etc/php7/conf.d/apcu.ini \
    && echo "extension=apc.so" > /etc/php7/conf.d/z_apc.ini

#Cleanup dev packages
RUN apk del --purge \
    autoconf \
    php7-pear \
    php7-dev \
    alpine-sdk \
    && rm -rf /var/cache/apk/*
	
#Link php7 exec to more standard php name
#Remove useless config
RUN ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /etc/php7/php-fpm.d

#Copy special configs
COPY php.ini         /etc/php7/php.ini
COPY php-fpm.conf    /etc/php7/php-fpm.conf

#Copy core local config
COPY local.json   /local.json

#Phabricator code, File storage, Code storage and missing PATH folder
RUN mkdir -p /srv \
    && mkdir -p /data \
	&& mkdir -p /repo \
	&& mkdir -p /usr/local/sbin

#Redirect the daemon logs
RUN mkdir -p /var/tmp/phd/log \
    && ln -fs /proc/self/fd/2 /var/tmp/phd/log/daemons.log

#Set port
EXPOSE 9000

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

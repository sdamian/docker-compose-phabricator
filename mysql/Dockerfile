FROM alpine:edge
MAINTAINER Naerymdan <vincent.dev@gmail.com>
##
# Mysql 5.7+
##

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN addgroup -S mysql && adduser -S -g mysql mysql

RUN mkdir /docker-entrypoint-initdb.d

# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
RUN apk add --update mysql mysql-client tzdata bash \
    && rm -rf /var/cache/apk/* \
	&& rm -rf /var/lib/mysql \
	&& mkdir /var/lib/mysql \
	&& mkdir /run/mysqld

ADD custom.cnf /etc/mysql/my.cnf
RUN chmod 644 /etc/mysql/my.cnf

ADD stopwords.txt /stopwords.txt

# comment out a few problematic configuration values
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
#Phabricator on docker-compose
##DB layer: Alpine:edge with MariaDB

[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-mysql/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-mysql:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-mysql/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-mysql:latest)

##Web layer: Alpine:edge with Nginx
[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-nginx/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-nginx:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-nginx/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-nginx:latest)

##PHP layer: Ubuntu-based quantumobject/docker-baseimage:15.10 with PHP7
[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-php7/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-php7:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-php7/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-php7:latest)

A super compact Docker Compose setup with images based on [Alpine Linux][alpine]. Alpine core image is 5 MB and has access to a package repository that is as complete as any other.

**Will switch the Ubuntu layer for Alpine with PHP7 when the function crypt() stops creating a SEGFAULT **

#Why?
Phabricator is a pain to setup, especially in Docker. There is a lot of miscellaneous configuration needed and it requires multiple applications to run (database, web server, php-fpm and 5 php daemons!)

#Usage
Simply edit the ```docker-compose.yml``` file with the desired DB password and then call

```docker-compose up -d```

#License
The code in this repository, unless otherwise noted, is BSD licensed. See the LICENSE file in this repository.
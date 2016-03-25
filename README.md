#Phabricator on docker-compose
###DB layer: Alpine:edge with MariaDB
[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-mysql/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-mysql:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-mysql/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-mysql:latest)

###Web layer: Alpine:edge with Nginx
[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-nginx/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-nginx:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-nginx/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-nginx:latest)

###PHP layer: Alpine:edge with PHP7
[![Image Size](https://img.shields.io/imagelayers/image-size/naerymdan/docker-compose-phabricator-php7/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-php7:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/naerymdan/docker-compose-phabricator-php7/latest.svg)](https://imagelayers.io/?images=naerymdan/docker-compose-phabricator-php7:latest)

A super compact Docker Compose setup with images based on [Alpine Linux][alpine]. Alpine core image is 5 MB and has access to a package repository that is as complete as any other.

#Why?
Phabricator is a pain to setup, especially in Docker. There is a lot of miscellaneous configuration needed and it requires multiple applications to run (database, web server, php-fpm and 4 php daemons!)

*The whole thing can run on a single 5$/month Digital Ocean droplet with only 512MB of RAM!!!*

#Usage
Simply edit the ```docker-compose.yml``` file with the desired DB password and then call

```docker-compose up -d && docker-compose scale phd-task=2```

The setup issue ```Phabricator Daemons Are Not Running``` can be safely ignored as the container running the core Phabricator cannot see the daemons in the other containers.

To configure the rest of the Phabricator configuration, simply use the helper script ```config.sh```:

```
chmod +x config.sh
./config.sh set security.alternate-file-domain 'https://files.phabcdn.net/'
```

#License
The code in this repository, unless otherwise noted, is BSD licensed. See the LICENSE file in this repository.
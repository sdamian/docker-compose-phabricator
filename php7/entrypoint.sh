#!/bin/bash
if [ -d "/srv/phabricator" ]; then
	echo 'Updating phabricator'
	
	git -C /srv/libphutil pull
	git -C /srv/arcanist pull
	
	git -C /srv/phabricator stash
	git -C /srv/phabricator pull
	git -C /srv/phabricator stash pop

	echo 'Finished updating phabricator'
fi

if [ ! -d "/srv/phabricator" ]; then
	echo 'Cloning phabricator from source'
	
	git clone -b stable https://github.com/phacility/libphutil.git /srv/libphutil
	git clone -b stable https://github.com/phacility/arcanist.git /srv/arcanist
	git clone -b stable https://github.com/phacility/phabricator.git /srv/phabricator
	
	$MYSQL_ROOT_PASSWORD
	
	# Allow daemon to run foreground
    sed -i "s/\['daemonize'\] = true/\['daemonize'\] = false/g" /srv/phabricator/src/applications/daemon/management/PhabricatorDaemonManagementWorkflow.php
	
	mv /local.json /srv/phabricator/conf/local/local.json
	echo 'Finished cloning phabricator'
fi

echo 'Synching DB pasword'
sed -i "s/\"mysql.pass\": \"[^\"]*\",/\"mysql.pass\": \"$MYSQL_ROOT_PASSWORD\",/g" /srv/phabricator/conf/local/local.json

echo 'Upgrading database schema'
/srv/phabricator/bin/storage upgrade --force

echo 'Bootup Complete'
exec "/sbin/my_init"

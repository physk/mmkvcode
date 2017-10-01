#!/bin/bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PHPBIN="/usr/bin/php"

while getopts ":pw" optname
do
	case "$optname" in
		"w")
			echo "Running from web"
			$SCRIPTDIR/scripts/get-web.sh
			;;
		"p")
			echo "Running From php"
			$PHPBIN $SCRIPTDIR/scripts/get-php.php
			;;
		"?")
			echo "Unknown Argument - defaulting to web"
			$SCRIPTDIR/scripts/get-web.sh
			;;
	esac
done
if [ $OPTIND -eq 1 ]; then
	echo "Argument set - defaulting to web"
	$SCRIPTDIR/scripts/get-web.sh
fi

if [ -f "/tmp/tmpcode" ]; then
	echo "Found /tmp/tmpcode"
	if [ -f "/root/.MakeMKV/settings.conf" ]; then
		echo "/root/.MakeMKV/settings.conf found - Updating app_key"
		sed -ri 's|app_key = (.*)|app_key = "'`cat /tmp/tmpcode`'"|g' /root/.MakeMKV/settings.conf
	else
		echo "/root/.MakeMKV/settings.conf not found - Creating"
		mkdir -p /root/.MakeMKV/
		echo "app_key = \"`cat /tmp/tmpcode`\"" > /root/.MakeMKV/settings.conf
	fi		
fi

echo "Removing Temp file - /tmp/tmpcode"
rm -f /tmp/tmpfile

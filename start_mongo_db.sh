#!/bin/bash

. mongo_startstop.conf

if [ -f $MONGOPIDFILE ]; then
	echo "Process mongod possibly is running. (PID file exists)!"
	echo "Please solve manually"
	exit 1
fi

echo "Executing pre start script (cleaning up ramdisk)"
/usr/share/meteor/bundle/mongod_start_pre.sh

echo "Starting up mongodb"
/usr/bin/mongod \
	--config /usr/share/meteor/bundle/mongo-ramdisk.conf \
       	--oplogSize 8 \
	--replSet rs0 \
       	--noauth \
	--pidfilepath $MONGOPIDFILE \
	--nojournal \
	--fork

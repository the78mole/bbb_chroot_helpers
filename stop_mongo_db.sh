#!/bin/bash

. mongo_startstop.conf

if [ -f $MONGOPIDFILE ]; then
	MONGOPID=$(cat $MONGOPIDFILE)
	echo "Killing process $MONGOPID"
	kill $MONGOPID
	rm $MONGOPIDFILE
else
	echo "Mongo PID file does not exist. Mongo is not started yet?"
	exit 1
fi


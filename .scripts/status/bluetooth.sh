#!/bin/sh

device_query="$(rfkill --output "ID,TYPE,SOFT,HARD" | \
    grep "bluetooth" | head -n 1 | \
    sed 's/^\s//g;s/\s\+/ /g')"
dev_id="$(echo "$device_query" | cut -d " " -f 1)"
dev_soft="$(echo "$device_query" | cut -d " " -f 3)"

case "$1" in
    "toggle")
	if [ "$dev_soft" = "unblocked" ]; then
	    sudo rfkill block "$dev_id"
	else
	    sudo rfkill unblock "$dev_id"
	fi
	;;
    "on")
	sudo rfkill unblock "$dev_id"
	;;
    "off")
	sudo rfkill block "$dev_id"
	;;
    "*")
	echo Not available!
	;;
    "status" | "")
	if [ "$dev_soft" = "unblocked" ]; then
	    echo 
	else
	    echo 
	fi
	;;
esac

# On but not connected 


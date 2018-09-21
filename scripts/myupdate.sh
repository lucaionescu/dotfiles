#!/bin/bash

# script for updating filesystem and removing orphan packages
# adapted from https://bbs.archlinux.org/viewtopic.php?pid=729629#p729629

echo ":: updating..."

sudo pacman -Syu

echo " "
echo ":: update complete."
echo " "

sleep 2s

# check for (and remove) orphan packages
function remove_orphans {
    echo ":: check for orphan packages..."

    ORPHANS=`pacman -Qqdt`

    if [ -z "$ORPHANS" ]
    then
	echo ":: system is clean. exit..."
	sleep 2s
	exit
    else
	echo -e ":: orphans found.\n$ORPHANS\n\n:: Removing..."
	sudo pacman -R --nosave $ORPHANS
	sleep 2s
	exit
    fi
}

remove_orphans

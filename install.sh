#!/bin/bash

#
# A small install script for installing my configuration
# TODO: Add a note on if we did not succeed installing some script
# TODO: Add check to see if the files exists, diff in that case.
#

function install_config {
CONFIG=$1
CONFIG_DEST=$2
if [ $(ls $CONFIG) = 0 ]; then #file exists
    ln $CONFIG_DEST $CONFIG
    echo "Installed $CONFIG"
else
    EXISTS=0
    echo "The file $CONFIG exists, please install manually"
fi
}

OPTIONS="vimrc rtorrent.rc gitconfig vimperator.rc quit"
select opt in $OPTIONS; do
    if [ "$opt" = "quit" ]; then
        echo done
        exit
    elif [ "$opt" = "vimrc" ]; then
        install_config vimrc ~/.vimrc
    elif [ "$opt" = "rtorrent.rc" ]; then
        install_config rtorrent.rc ~/.rtorrent.rc
    elif [ "$opt" = "gitfoncig" ]; then
        install_config gitconfig ~/.gitconfig
    elif [ "$opt" = "vimperator.rc" ]; then
        install_config vimperatorrc ~/.vimperatorrc
    else
        clear
        echo bad option
    fi
done



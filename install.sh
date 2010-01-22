#!/bin/bash

#
# A small install script for installing my configuration
# TODO: Add questions on which configuration files to install.
# TODO: Add a note on if we did not succed installing some script
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

install_config vimrc ~/.vimrc
install_config rtorrent.rc ~/.rtorrent.rc
install_config gitconfig ~/.gitconfig
install_config vimperatorrc ~/.vimperatorrc

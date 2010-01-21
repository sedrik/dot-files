#!/bin/bash

#
# A small install script for installing my configuration
# TODO: Add questions on which configuration files to install.
# TODO: Refactor out a function to do this stuff
#

if [ $(ls ~/.vimrc) = 0 ]; then #file exists
    ln vimrc ../.vimrc
else
    echo "The file ~/.vimrc exists, will not install vimrc"
fi

if [ $(ls ~/.vimrc) = 0 ]; then #file exists
    ln rtorrent.rc ../.rtorrent.rc
else
    echo "The file ~/.vimrc exists, will not install vimrc"
fi

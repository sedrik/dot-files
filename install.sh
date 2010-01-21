#!/bin/bash

#
# A small install script for installing my configuration
# TODO: Add questions on which configuration files to install.
# TODO: Refactor out a function to do this stuff
#

VIMRC=~/.vimrc
if [ $(ls $VIMRC) = 0 ]; then #file exists
    ln vimrc $VIMRC
else
    echo "The file $VIMRC exists, will not install vimrc"
fi

RTORRENTRC=~/.rtorrent.rc
if [ $(ls $RTORRENTRC) = 0 ]; then #file exists
    ln rtorrent.rc $RTORRENTRC
else
    echo "The file $RTORRENTRC exists, will not install vimrc"
fi

GITCONFIG=~/.gitconfig
if [ $(ls $GITCONFIG) = 0 ]; then #file exists
    ln rtorrent.rc $GITCONFIG
else
    echo "The file $GITCONFIG exists, will not install vimrc"
fi

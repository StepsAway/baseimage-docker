#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

## Often used tools.
$minimal_apt_get_install less vim-tiny psmisc gettext git
ln -s /usr/bin/vim.tiny /usr/bin/vim

## This tool runs a command as another user and sets $HOME.
cp /bd_build/bin/setuser /sbin/setuser

## Copy install-configs files into my_init.d
cp /bd_build/configs/50-install-configs.sh /etc/my_init.d/50-install-configs.sh

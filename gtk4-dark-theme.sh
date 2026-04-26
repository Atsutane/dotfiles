#!/bin/sh

if [ -e /usr/bin/gsettings ]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
    echo 'gsettings required.'
    exit 1;
fi


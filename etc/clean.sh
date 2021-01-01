#!/bin/sh

if [ -e "$1" ]; then
    if [ -L "$1" ]; then
        rm -iv "$1"
    else
        printf "[+] We won't remove %s bacause this file is not a symbolic link.\n"\
               "$1"
    fi
else
    printf "[+] %s doesn't exist.\n" "$1"
fi

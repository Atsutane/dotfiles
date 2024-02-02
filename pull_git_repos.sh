#!/bin/bash

cd ~/git
for f in * ; do
    if [ -d "$f" ] && [ -d "$f/.git" ]; then
        cd "$f"
        echo -e "\n\e[1m" ; pwd ; echo -e "\e[0m"
        git pull
        cd ~/git
    fi
done


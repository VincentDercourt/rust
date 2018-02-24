#!/bin/bash

if [ ! -f "rustserver" ]; then
    wget https://gameservermanagers.com/dl/rustserver
    chmod +x rustserver
fi
if [ ! -d "serverfiles" ]; then
    ./rustserver auto-install
    ./rustserver mods-install <<< "rustoxide
y
"
fi

yes Y | ./rustserver update
yes Y | ./rustserver mods-update

yes Y | ./rustserver start

/bin/bash
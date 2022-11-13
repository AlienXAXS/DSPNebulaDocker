#!/bin/bash
# Installation Script to be ran inside the docker container
#
## Define variables
export HOME=/mnt/server

## Install dependencies
dpkg --add-architecture i386
apt update
apt -y --no-install-recommends install curl unzip libstdc++6 lib32gcc1 ca-certificates libsdl2-2.0-0:i386 cabextract
apt install -y --install-recommends wine wine64 xvfb

## Install WineTricks
export DISPLAY=:0.0
export WINEPREFIX=$HOME/.wine
rm -r $HOME/.wine
rm -r $HOME/.cache
mkdir -p $HOME/.wine
mkdir /tmp/winetricks
curl https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -o /tmp/winetricks/winetricks
chmod +x /tmp/winetricks/winetricks
Xvfb :0 -screen 0 1024x768x16 &
env WINEDLLOVERRIDES="mscoree;mshtml=" xvfb-run wine wineboot --init --force /nogui && xvfb-run wineserver -w
env /tmp/winetricks/winetricks -q vcrun2017
env /tmp/winetricks/winetricks -q vcrun2013
env /tmp/winetricks/winetricks -q sound=disabled
env /tmp/winetricks/winetricks -q corefonts
env /tmp/winetricks/winetricks -q --force dotnet45
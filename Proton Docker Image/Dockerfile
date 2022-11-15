FROM		debian:bullseye-slim

LABEL		author="AlienX" maintainer="hello@agngaming.com"

ENV		DEBIAN_FRONTEND noninteractive

RUN		useradd -m -d /home/container -s /bin/bash container

RUN		ln -s /home/container/ /nonexistent

ENV		USER=container HOME=/home/container

## Update base packages
RUN		apt update \
		&& apt upgrade -y

## Enable 32bit Support
RUN		dpkg --add-architecture i386

## Install dependencies
RUN		apt install -y gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
             libfontconfig libicu67 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev-compat libduktape205 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
             liblua5.3-0 libz-dev rapidjson-dev tzdata libevent-dev libzip4 libprotobuf23 nano vim p7zip

## Install Wine
RUN             sh -c 'echo " deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list.d/wine.list'
RUN             wget -qnc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key
RUN		apt update
RUN		apt install -y --install-recommends winehq-stable

## Install WineTricks
RUN		wget -q -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
		&& chmod +x /usr/bin/winetricks

## Install Xvfb
RUN		apt install -y --no-install-recommends gnupg2 tzdata software-properties-common libntlm0 winbind xvfb xauth python3 libncurses5:i386 libncurses6:i386

## Configure locale
RUN             update-locale lang=en_US.UTF-8 \
                && dpkg-reconfigure --frontend noninteractive locales

## Install Wine-GE-Proton
WORKDIR /usr/share
RUN		curl -L https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton7-34/wine-lutris-GE-Proton7-34-x86_64.tar.xz --output WGEP.tar.xz
RUN		mkdir Proton && mkdir tmp
RUN		tar -xvf WGEP.tar.xz && mv ./lutris-GE-Proton7-34-x86_64/* ./Proton/ && chown root:root -R ./Proton
RUN		rm -f WGEP.tar.xz && rm -rf ./lutris-GE-Proton7-34-x86_64

ENV	PROTON=/usr/share/Proton
ENV     HOME=/home/container
ENV     WINEPREFIX=/home/container/.wine
ENV     WINEDLLOVERRIDES="mscoree,mshtml="
ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16
ENV     AUTO_UPDATE=1
ENV     XVFB=1

USER container
WORKDIR /home/container

COPY        ./entry-point.sh /entry-point.sh
CMD         [ "/bin/bash", "/entry-point.sh" ]

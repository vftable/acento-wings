FROM        node:16-bullseye-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping chromium-browser sudo \
            && useradd -m -d /home/container docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN         npm install npm@latest -g

USER        docker
ENV         USER=docker HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]

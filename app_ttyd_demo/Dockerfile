ARG BASE_DISTRO=arm64v8/debian:stable-slim

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/TexasInstruments/seva-adocker/app_ttyd_demo

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
    apt-get install -y build-essential ca-certificates cmake chromium git libjson-c-dev libwebsockets-dev && \
    mkdir /tmp/gpu/ttyd && cd /tmp/gpu/ttyd && \
    git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && mkdir build && cd build && \
    cmake .. && make && make install && \
    cp ./ttyd /tmp/gpu/ && \
    rm -rf /tmp/gpu/ttyd/ttyd && \
    addgroup --gid 786 tisdk && \
    # Add user tisdk with uid & gid as 786.
    adduser --disabled-password --uid 786 --gid 786 --gecos "" --home /home/tisdk --shell /bin/bash tisdk && \
    # Add tisdk to sudoers & make it passwordless
    adduser tisdk sudo && usermod -aG sudo tisdk && echo "tisdk ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    apt-get purge -y --auto-remove git build-essential ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Set default user as tisdk         
USER tisdk

ENTRYPOINT ["/bin/bash", "-c" , "/tmp/gpu/ttyd -W bash & chromium --start-fullscreen http://localhost:7681/"]

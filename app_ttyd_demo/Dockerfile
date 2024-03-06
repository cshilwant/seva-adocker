ARG BASE_DISTRO=arm64v8/debian:stable-slim

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/TexasInstruments/seva-adocker/app_ttyd_demo

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
    apt-get install -y build-essential ca-certificates cmake chromium git libjson-c-dev libwebsockets-dev && \
    mkdir /tmp/gpu && cd /tmp/gpu && \
    git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && mkdir build && cd build && \
    cmake .. && make && make install && \
    apt-get purge -y --auto-remove git build-essential ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "-c" , "/tmp/gpu/ttyd/build/ttyd -W bash &; chromium http://localhost:7681/"]

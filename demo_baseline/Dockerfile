ARG BASE_DISTRO=arm64v8/debian:stable-slim
FROM $BASE_DISTRO
LABEL org.opencontainers.image.source https://github.com/TexasInstruments/seva-adocker/demo_baseline
RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
         apt-get install -y --no-install-recommends git \
         qt5-qmake qtbase5-dev qtwayland5 qtscript5-dev \
         libqt5svg5-dev build-essential ca-certificates

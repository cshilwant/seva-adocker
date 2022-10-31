ARG BASE_DISTRO=arm64v8/debian:bullseye

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/nmenon/adocker/demo_browser_baseline

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update
RUN export DEBIAN_FRONTEND=non-interactive; apt-get install -y firefox-esr

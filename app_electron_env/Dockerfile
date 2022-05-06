ARG BASE_DISTRO=ghcr.io/nmenon/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/nmenon/adocker/app_electron_env

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
	apt-get install -y apt-transport-https wget npm && \
	npm install -g electron


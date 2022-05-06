ARG BASE_DISTRO=ghcr.io/nmenon/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/nmenon/adocker/app_electron_env

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
	apt-get install -y apt-transport-https wget curl && \
	apt-get install -y libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN export DEBIAN_FRONTEND=noninteractive; apt-get install -y nodejs


RUN \
	npm install -g electron@latest && \
	chown root.root /usr/lib/node_modules/electron/dist/chrome-sandbox && \
	chmod 4755 /usr/lib/node_modules/electron/dist/chrome-sandbox


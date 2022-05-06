ARG BASE_DISTRO=ghcr.io/nmenon/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/nmenon/adocker/app_thermostat_demo

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update && \
	apt-get install -y apt-transport-https wget && \
	wget -q -O -  'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xDB348A58A292E9BC'|sudo apt-key add - && \
	add-apt-repository -y "deb https://repo.netsyms.com/apt main main" && \
	apt-get update && \
	apt-get install nw.js-sdk


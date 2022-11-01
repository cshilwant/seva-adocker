ARG BASE_DISTRO=arm64v8/debian:bullseye

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/nmenon/adocker/demo_browser_baseline

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update

# Add an ordinary user - This is not going to change - we are going to operate as this user
# The startup shell script maps us back to the correct user
RUN mkdir -p /workdir && groupadd -r swuser -g 1000 && \
	useradd -u 1000 -r -g swuser -d /workdir -s /sbin/nologin -c "Browser user" swuser && \
	chown -R swuser:swuser /workdir

RUN export DEBIAN_FRONTEND=non-interactive; apt-get install -y firefox-esr

WORKDIR /workdir
USER swuser
ENTRYPOINT ["/usr/bin/firefox"]

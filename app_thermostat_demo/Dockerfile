ARG BASE_DISTRO=ghcr.io/cshilwant/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/app_thermostat_demo

RUN mkdir /tmp/gpu && cd /tmp/gpu && \
         git clone https://git.ti.com/git/apps/thermostat-demo.git thermostat_demo && \
         cd thermostat_demo && qmake && make


ENTRYPOINT ["/tmp/gpu/thermostat_demo/ThermostatDemo"]

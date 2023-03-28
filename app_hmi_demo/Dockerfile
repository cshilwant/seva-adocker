ARG BASE_DISTRO=ghcr.io/nmenon/demo_baseline

FROM $BASE_DISTRO

RUN mkdir /tmp/gpu && cd /tmp/gpu && \
         git clone https://git.ti.com/git/apps/hmi-demo.git hmi-demo && \
         cd hmi-demo && qmake && make


ENTRYPOINT ["/tmp/gpu/hmi_demo/IndustrialHMIDemo"]

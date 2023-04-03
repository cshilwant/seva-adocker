ARG BASE_DISTRO=arm64v8/debian:stable-slim

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/app_qimgv_demo

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update
RUN export DEBIAN_FRONTEND=noninteractive; \
         apt-get install -y build-essential git cmake \
         qtbase5-dev libqt5svg5-dev qttools5-dev \
         libexiv2-dev libmpv-dev libopencv-dev \
         wget kimageformat-plugins gcc g++ 
RUN mkdir /tmp/gpu && cd /tmp/gpu && \
         wget https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/docker-icon.png && \
         git clone https://github.com/easymodo/qimgv.git && \
         cd qimgv && mkdir -p build && cd build && \
         cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_INSTALL_LIBDIR=lib && \
         make -j`nproc`
         
ENTRYPOINT ["/tmp/gpu/qimgv/build/qimgv/qimgv", "/tmp/gpu/docker-icon.png"]

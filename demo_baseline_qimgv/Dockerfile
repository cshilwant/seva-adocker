ARG BASE_DISTRO=arm64v8/ubuntu:22.10

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/demo_baseline_qimgv

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update
RUN export DEBIAN_FRONTEND=noninteractive; \
         apt-get install -y build-essential git cmake \
         qtbase5-dev libqt5svg5-dev qttools5-dev \
         libexiv2-dev libmpv-dev libopencv-dev \
         kimageformat-plugins gcc g++

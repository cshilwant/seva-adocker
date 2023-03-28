ARG BASE_DISTRO=arm64v8/debian:bullseye

FROM $BASE_DISTRO

LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/demo_baseline

RUN export DEBIAN_FRONTEND=noninteractive; apt-get update
RUN export DEBIAN_FRONTEND=noninteractive; \
         apt-get install -y git vim kmscube mesa-utils \
         qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools qtcreator qtwayland5 qtwayland5-dev-tools \
         wayland-protocols libwayland-dev libqt5waylandclient5 libqt5waylandcompositor5 \
         libwayland-bin libwayland-client0 libwayland-egl-backend-dev libwayland-egl1 libwayland-egl1-mesa libwayland-server0 \
         mesa-utils libegl1-mesa libegl1-mesa-dev libgbm-dev libgbm1 libgl1-mesa-dev libgl1-mesa-dri libgl1-mesa-glx \
         libglu1-mesa libglu1-mesa-dev \
         qtscript5-dev libqt5svg5-dev build-essential qtdeclarative5-dev

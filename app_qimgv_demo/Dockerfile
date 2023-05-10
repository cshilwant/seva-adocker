ARG BASE_DISTRO=ghcr.io/cshilwant/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/app_qimgv_demo

RUN mkdir /tmp/gpu && cd /tmp/gpu && \
         wget https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/08_06_00_42/exports/docs/_images/AM62X_CAMERA_DEMO.jpg && \
         git clone https://github.com/easymodo/qimgv.git && \
         cd qimgv && mkdir -p build && cd build && \
         cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_INSTALL_LIBDIR=lib && \
         make -j`nproc`
         
ENTRYPOINT ["/tmp/gpu/qimgv/build/qimgv/qimgv", "/tmp/gpu/AM62X_CAMERA_DEMO.jpg"]

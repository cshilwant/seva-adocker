ARG BASE_DISTRO=ghcr.io/cshilwant/demo_baseline

FROM $BASE_DISTRO


LABEL org.opencontainers.image.source https://github.com/cshilwant/adocker/app_qimgv_demo

RUN mkdir /tmp/gpu && cd /tmp/gpu && \
         wget https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/docker-icon.png && \
         git clone https://github.com/easymodo/qimgv.git && \
         cd qimgv && mkdir -p build && cd build && \
         cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_INSTALL_LIBDIR=lib && \
         make -j`nproc`
         
ENTRYPOINT ["/tmp/gpu/qimgv/build/qimgv/qimgv", "/tmp/gpu/docker-icon.png"]

FROM golang:1.17.3-bullseye

# install cross compiler for ARM

RUN apt-get update; \
    apt-get install -y  \
            libc6-armel-cross \
            libc6-dev-armel-cross \
            gcc-arm-linux-gnueabi \
            ; \
    apt-get install -y \
            binutils-arm-linux-gnueabi \
            g++-arm-linux-gnueabi \
            gcc-arm-linux-gnueabihf \
            ;\
    apt-get install -y \
            libncurses5-dev \
            ; \
    rm -rf /var/lib/apt/lists/*
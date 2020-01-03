FROM ubuntu:18.04 AS build

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    autoconf \
    bison \
    build-essential \
    clang \
    cmake \
    curl \
    flex \
    gawk \
    git \
    gperf \
    graphviz \
    gtkwave \
    libboost-program-options-dev \
    libffi-dev \
    libftdi-dev \
    libgmp-dev \
    libreadline-dev \
    mercurial \
    pkg-config \
    python \
    python3 \
    tcl-dev \
    wget \
    xdot

# yosys
WORKDIR /build
RUN git clone https://github.com/YosysHQ/yosys.git yosys
WORKDIR /build/yosys
RUN make config-clang
RUN DESTDIR=/install make install -j$(nproc)

FROM ubuntu:18.04 AS dev

ENV DEBIAN_FRONTEND noninteractive

COPY --from=build /install/ /
RUN apt-get update && apt-get install -y \
    libffi-dev \
    libtcl8.6 \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

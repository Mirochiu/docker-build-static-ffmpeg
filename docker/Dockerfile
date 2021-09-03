FROM ubuntu:16.04

RUN apt-get update -qq

RUN apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libtool \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm

# for ffplay
# RUN apt-get -y install libsdl2-dev libva-dev libvdpau-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev

# not found using pkg-config if static build
# RUN apt-get -y install libass-dev

# RUN apt-get -y install libgnutls28-dev librtmp-dev
# /usr/bin/ld: attempted static link of dynamic object `/usr/lib/x86_64-linux-gnu/libz.so'


FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libfreetype6-dev \
  libtool \
  libvorbis-dev \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
  nasm \
  libx264-dev \
  libssl-dev \
  libvpx-dev \
  libmp3lame-dev \
  libopus-dev

# for ffplay
# RUN apt-get -y install libsdl2-dev libva-dev libvdpau-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev

# not found using pkg-config if static build
# RUN apt-get -y install ibgnutls28-dev libass-dev l libx265-dev libnuma-dev libfdk-aac-dev librtmp-dev libxml2-dev
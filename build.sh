#!/bin/bash

echo "workdir:$(pwd) processors:$(nproc) outdir:${OUT_DIR}"

echo "start to build zlib"
cd /usr/src/dep/zlib-1.2.11
pwd
make distclean
./configure --prefix=/usr --static && make -j$(nproc) && make install
cd -

apt-get -y install \
  libfreetype6-dev \
  libvorbis-dev \
  libx264-dev \
  libvpx-dev \
  libmp3lame-dev \
  libopus-dev \
  icu-devtools \
  libicu-dev \
  liblzma-dev

echo "start to build xml2"
cd /usr/src/dep/libxml2-2.9.2
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build fdk-aac"
cd /usr/src/dep/fdk-aac-2.0.2
pwd
make clean
./autogen.sh
./configure --prefix=/usr && make -j$(nproc) && make install
cd -

echo "start to build numactl"
cd /usr/src/dep/numactl-2.0.14
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build x265"
cd /usr/src/dep/x265-3.4
pwd
make clean
cmake ./source -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF && make -j$(nproc) && make install
cd -

echo "start to build svt-av1"
cd /usr/src/dep/SVT-AV1-v0.8.7
pwd
make clean
cd Build && cmake .. -G"Unix Makefiles" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release && make -j$(nproc) && make install
cd -

apt-get -y install python3 python3-setuptools

echo "start to install meson"
cd /usr/src/dep/meson-0.49.0
pwd
python3 setup.py install
cd -

apt-get -y remove python3-setuptools

echo "start to install nasm"
cd /usr/src/dep/nasm-nasm-2.15.05
pwd
make distclean
./autogen.sh
./configure --prefix=/usr && sed -i -e 393,394d Makefile && make -j$(nproc) && make install
cd -

echo "start to build libdav1d"
cd /usr/src/dep/dav1d-0.9.1 && rm -rf build
pwd
mkdir build
meson build --prefix=/usr --buildtype release --default-library=static && ninja -C build && ninja -C build install
cd -

echo "start to build gmp"
cd /usr/src/dep/gmp-6.2.1
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build nettle"
cd /usr/src/dep/nettle-3.4.1
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build libtasn1"
cd /usr/src/dep/libtasn1-4.9
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build libunistring"
cd /usr/src/dep/libunistring-0.9.10
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

echo "start to build libffi"
cd /usr/src/dep/libffi-3.0.9
pwd
make clean
./configure --prefix=/usr --enable-static && make -j$(nproc) && make install
cd -

apt-get -y install gettext

echo "start to build gnutls"
cd /usr/src/dep/gnutls-3.6.16
pwd
make clean
./configure --prefix=/usr --enable-static --without-p11-kit && make -j$(nproc) && make install
cd -

echo "start to build ffmpeg"
cd /usr/src/ffmpeg
make distclean
PKG_CONFIG_PATH="${OUT_DIR}/lib/pkgconfig" ./configure \
  --prefix="${OUT_DIR}" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I${OUT_DIR}/include" \
  --extra-ldflags="-L${OUT_DIR}/lib" \
  --extra-libs="-lpthread -lm -ldl" \
  --extra-ldexeflags="-static" \
  --ld="g++" \
  --enable-gpl \
  --enable-gnutls \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-libfreetype \
  --enable-libfdk-aac \
  --enable-libx265 \
  --enable-libsvtav1 \
  --enable-libdav1d \
  --enable-demuxer=dash --enable-libxml2 \
  --disable-doc \
  --disable-debug

make -j$(nproc) && make install

# cannot install by apt-get
# --enable-libaom \

# wait for test
# wget -c https://github.com/libass/libass/releases/download/0.15.1/libass-0.15.1.tar.gz -O - | tar -xz
# --enable-libass \

# got error when configure
# /usr/bin/ld: attempted static link of dynamic object `/usr/lib/x86_64-linux-gnu/libz.so'
# --enable-librtmp \

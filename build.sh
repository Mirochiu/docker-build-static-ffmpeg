#!/bin/bash

echo "workdir:$(pwd) processors:$(nproc) outdir:${OUT_DIR}"
make distclean
PKG_CONFIG_PATH="${OUT_DIR}/lib/pkgconfig" ./configure \
  --prefix="${OUT_DIR}" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I${OUT_DIR}/include" \
  --extra-ldflags="-L${OUT_DIR}/lib" \
  --extra-libs="-lpthread -lm -lz" \
  --extra-ldexeflags="-static" \
  --ld="g++" \
  --enable-gpl \
  --enable-openssl \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-libfreetype \
  --disable-doc \
  --disable-debug \
  && make -j$(nproc) \
  && make install

# cannot install by apt-get
# --enable-libaom \
# --enable-libsvtav1 \
# --enable-libdav1d \

# not found using pkg-config if static build
# --enable-gnutls \
# --enable-libass \
# --enable-libx265 \
# --enable-libfdk-aac \
# --enable-librtmp \
# --enable-demuxer=dash --enable-libxml2 \

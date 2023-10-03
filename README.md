# Build static ffmpeg with docker

This project is used to build a static version of ffmpeg by docker compose

## How to use this project

1. enter this projet root directory

2. download ffmpeg source code

   `wget -c https://ffmpeg.org/releases/ffmpeg-4.4.4.tar.gz -O - | tar -xz`

3. run docker compose for build

   `docker compose up --build`

4. get the built files

   - `./ffmpeg-4.4.4/static-bins/bin/ffprobe`
   - `./ffmpeg-4.4.4/static-bins/bin/ffmpeg`


   ```text
   ffmpeg version 4.4.4 Copyright (c) 2007-2023 the FFmpeg developers
     built with gcc 5.4.0 (Ubuntu 5.4.0-6ubuntu1~16.04.12) 20160609
     configuration: --prefix=static-bins/ --pkg-config-flags=--static --extra-cflags=-Istatic-bins//include --extra-ldflags=-Lstatic-bins//lib --extra-libs='-lpthread -lm -lz' --extra-ldexeflags=-static --ld=g++ --enable-gpl --enable-openssl --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-libfreetype --disable-doc --disable-debug
   ```

## Try your ffmpeg builts

1. ffprobe

        ./ffmpeg-4.4.4/static-bins/bin/ffprobe -i file:///mnt/hdd2/content/clear.mp4

2. ffmpeg

        ./ffmpeg-4.4.4/static-bins/bin/ffmpeg -i file:///mnt/hdd2/content/clear.mp4 convert.ts


## Reference

https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

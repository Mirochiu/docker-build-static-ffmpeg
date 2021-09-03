This project is used to build a static version of ffmpeg by docker-compose

1. enter this projet root directory

2. download source codes

wget -c https://ffmpeg.org/releases/ffmpeg-4.4.tar.gz -O - | tar -xz
or
git clone --depth 1 -b release/4.4 --single-branch https://git.ffmpeg.org/ffmpeg.git ffmpeg-4.4

sudo apt install xz-utils lzip

cd dep
wget -c https://zlib.net/fossils/zlib-1.2.11.tar.gz -O - | tar -xz
wget -c ftp://xmlsoft.org/libxml2/libxml2-2.9.2.tar.gz -O - | tar -xz
wget -c https://github.com/mstorsjo/fdk-aac/archive/refs/tags/v2.0.2.tar.gz -O - | tar -xz
wget -c https://github.com/videolan/x265/archive/refs/tags/3.4.tar.gz -O - | tar -xz
wget -c https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v0.8.7/SVT-AV1-v0.8.7.tar.gz -O - | tar -xz
wget -c https://github.com/numactl/numactl/releases/download/v2.0.14/numactl-2.0.14.tar.gz -O - | tar -xz
wget -c https://github.com/mesonbuild/meson/archive/refs/tags/0.49.0.tar.gz -O - | tar -xz
wget -c https://github.com/netwide-assembler/nasm/archive/refs/tags/nasm-2.15.05.tar.gz -O - | tar -xz
wget -c https://code.videolan.org/videolan/dav1d/-/archive/0.9.1/dav1d-0.9.1.tar.gz -O - | tar -xz
wget -c https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.16.tar.xz -O - | tar -xJ
wget -c https://ftp.gnu.org/gnu/nettle/nettle-3.4.1.tar.gz -O - | tar -xz
wget -c https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz -O - | tar --lzip -x
wget -c http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.9.tar.gz -O - | tar -xz
wget -c https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz -O - | tar -xJ
wget -c https://github.com/libffi/libffi/archive/refs/tags/v3.0.9.tar.gz -O - | tar -xz
wget -c https://github.com/webmproject/libvpx/archive/refs/tags/v1.10.0.tar.gz -O - | tar -xz

4. run docker-compose for build

docker-compose up --build

5. get the built files

out/bin/ffprobe
out/bin/ffmpeg

6. (optional) try your static build

./ffprobe -i file:///mnt/hdd2/content/clear.mp4
./ffmpeg -i file:///mnt/hdd2/content/clear.mp4 convert.ts

ref:
https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

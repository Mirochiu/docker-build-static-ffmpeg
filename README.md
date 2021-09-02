This project is used to build a static version of ffmpeg by docker-compose

# How to use this project
1. enter this projet root directory

2. download ffmpeg source code

        wget -c https://ffmpeg.org/releases/ffmpeg-4.4.tar.gz -O - | tar -xz

   or

        git clone --depth 1 -b release/4.4 --single-branch https://git.ffmpeg.org/ffmpeg.git ffmpeg-4.4

3. run docker-compose for build

        docker-compose up --build

4. get the built files

   out/bin/ffprobe
   out/bin/ffmpeg

# Try your ffmpeg builts

1. ffprobe

        ./out/bin/ffprobe -i file:///mnt/hdd2/content/clear.mp4

2. ffmpeg

        ./out/bin/ffmpeg -i file:///mnt/hdd2/content/clear.mp4 convert.ts

# Reference
   https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

# adapted from https://github.com/schickling/dockerfiles

FROM ubuntu:18.04
LABEL maintainer="Hagar Usama <hagar_usama@outlook.com>"

ARG DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update
RUN apt-get install -y libopencv-dev yasm libjpeg-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils pkg-config
RUN apt-get install -y curl build-essential checkinstall cmake
RUN apt install -y git-all


# project dependencies
RUN apt install -y libpcl-dev
RUN apt-get -y install nano
RUN apt-get install -y silversearcher-ag


# cleanup package manager
RUN apt-get remove --purge -y curl build-essential checkinstall cmake
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir /source

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]

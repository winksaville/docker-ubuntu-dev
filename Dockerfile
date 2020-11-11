FROM ubuntu:20.04

LABEL Description="A Linux image suitable"
LABEL Author="Wink Saville"
LABEL Email="wink@saville.com"

ARG DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
        build-essential \
        autoconf \
        automake \
        libtool \
        pkg-config \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        wget \
        git \
        curl \
        gnupg \
        zlib1g-dev \
        swig \
        locales \
        vim \
        gdb \
        valgrind \
	python3-setuptools \
        cmake \
        ninja-build \
        nodejs \
        npm


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

#ENV LC_ALL en_US,UTF-8
ENV LANG en_US,UTF-8
ENV LANGUAGE en_US,UTF8

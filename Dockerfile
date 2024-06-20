FROM debian:latest
LABEL maintainer.name="Bernd Robertz"
LABEL maintainer.email="brobertz.net@gmail.com"
LABEL version="1.0"
LABEL description="Rapsberry Pico Docker development enviroment, with the Pico SDK and the blink example."

WORKDIR /opt
ENV DEBIAN_FRONTEND=noninteractive
ENV PICO_SDK_PATH=/opt/pico-sdk


RUN apt update && \
	apt install -y git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib build-essential python3 gdb-multiarch && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/pico
RUN git clone https://github.com/raspberrypi/pico-sdk.git
RUN git -C pico-sdk submodule update --init
COPY ./blink_example /opt/blink_example

WORKDIR /opt/pico

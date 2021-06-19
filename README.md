# libfacedetection-raspberrypi

![libfacedetection-raspberrypi](https://i.ibb.co/QD8t7Cy/libfacedetection-raspberrypi.png)

Precompiled **libfacedetection** binaries for **Raspberry Pi 3 & 4**. 

## Supported features

* NEON optimization
* OpenMP multi-threading

## Prerequisites

### Supported Boards

* Raspberry Pi 3 Model A+
* Raspberry Pi 3 Model B+
* Raspberry Pi 4 Model B

Tested on Raspberry Pi 4 Model B (8 GB).

### Supported OS

* Raspberry Pi OS Buster (32-bit)

## Install

* `wget https://github.com/prepkg/libfacedetection-raspberrypi/releases/latest/download/libfacedetection.deb`
* `sudo apt install -y ./libfacedetection.deb`

## Uninstall

* `sudo apt purge --autoremove -y libfacedetection`

## Debian Package

Debian package contains the following shared libraries:

| Library                     | Description                                              |
| :-------------------------  | :------------------------------------------------------- |
| libfacedetection.so         | CNN-based face detection                                 |

## Reference

1. [libfacedetection repository](https://github.com/ShiqiYu/libfacedetection)

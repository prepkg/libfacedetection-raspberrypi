# libfacedetection-raspberrypi

[![GitHub Release](https://img.shields.io/github/v/release/prepkg/libfacedetection-raspberrypi)](https://github.com/prepkg/libfacedetection-raspberrypi/releases/latest)
[![License](https://img.shields.io/github/license/prepkg/libfacedetection-raspberrypi)](https://github.com/prepkg/libfacedetection-raspberrypi/blob/master/LICENSE)
[![Downloads](https://img.shields.io/github/downloads/prepkg/libfacedetection-raspberrypi/total)](https://github.com/prepkg/libfacedetection-raspberrypi/releases)
[![Linux](https://github.com/prepkg/libfacedetection-raspberrypi/actions/workflows/linux.yaml/badge.svg)](https://github.com/prepkg/libfacedetection-raspberrypi/actions/workflows/linux.yaml)

> 🚀️ Always up-to-date [libfacedetection](https://github.com/ShiqiYu/libfacedetection) binaries for Raspberry Pi - just download and use it.

> ⭐ If you find this repository useful, please consider giving it a star.

The libfacedetection binaries are compiled with the [GCC Toolchain](https://github.com/prepkg/gcc-toolchain), ensuring
compatibility across a wide range of Raspberry Pi boards running Raspberry Pi OS 64-bit. GitHub CI workflows are used to
automate the build process: pipelines run daily, but new builds are triggered only when a new libfacedetection release
is available.

## Why?

* **No official libfacedetection packages.** There are no prebuilt official libfacedetection packages for Raspberry Pi
  OS, forcing users to compile it from source themselves.
* **Optimized binaries.** libfacedetection is built with NEON optimizations enabled, giving a real performance boost on
  Raspberry Pi hardware compared to a build without them.
* **Always up to date.** GitHub CI workflows rebuild and publish libfacedetection automatically whenever a new version
  is released upstream.
* **No extra dependencies.** libfacedetection is built as a static library, so it links directly into your application
  with no shared library to install or manage at runtime.

## Build Information

* Statically linked library, compiled as position-independent code (PIC) so it can be embedded in both static and shared
  applications.
* Built with NEON optimizations enabled for better performance on Raspberry Pi.

## Precompiled Binaries

If you prefer not to build the libfacedetection yourself, a precompiled libfacedetection can be downloaded from the [releases page](https://github.com/prepkg/libfacedetection-raspberrypi/releases).

```shell
curl -sSLo libfacedetection.deb https://github.com/prepkg/libfacedetection-raspberrypi/releases/latest/download/libfacedetection-aarch64-linux-gnu.deb \
  && sudo apt install -y ./libfacedetection.deb \
  && rm -rf libfacedetection.deb
```

## Compilation

### Requirements

* Git
* Docker

### Instructions

* Clone the repository:

```shell
git clone https://github.com/prepkg/libfacedetection-raspberrypi.git && cd libfacedetection-raspberrypi
```

* Build the Docker image:

```shell
./setup.sh build-image
```

* Build the library:

```shell
./setup.sh build-lib
```

After compilation, the `deb` package will be available in the `build` directory.

* (Optional) Run the test to verify that the library links correctly and the resulting binary runs under QEMU:

```shell
./setup.sh test-lib
```

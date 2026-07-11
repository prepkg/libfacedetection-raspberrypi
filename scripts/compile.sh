#!/bin/bash
set -eo pipefail

APP=$(pwd)
mkdir -p $APP/build /tmp/libfacedetection

VERSION=$(git ls-remote https://github.com/ShiqiYu/libfacedetection HEAD | cut -f1)
curl -sSL https://github.com/ShiqiYu/libfacedetection/archive/$VERSION.tar.gz | tar xz --strip-components=1 -C /tmp/libfacedetection

{
  echo $VERSION

  cd /tmp/libfacedetection && rm -rf build
  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_TOOLCHAIN_FILE=$APP/scripts/pi.cmake \
    -DCMAKE_INSTALL_PREFIX=build/install/usr/local \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DENABLE_NEON=ON \
    -DENABLE_AVX2=OFF
  cmake --build build -j$(nproc)
  cmake --install build --strip
} 2>&1 | tee $APP/build/libfacedetection-aarch64-linux-gnu.txt

cd /tmp/libfacedetection/build && mkdir install/DEBIAN

cat << EOF > install/DEBIAN/control
Package: libfacedetection
Version: 0.0.1-${VERSION:0:7}-1
Architecture: arm64
Maintainer: prepkg <precompiledpkg@gmail.com>
Description: CNN-based face detection
EOF

cat << EOF > install/DEBIAN/postinst
#!/bin/bash

ldconfig
EOF

chmod 755 install/DEBIAN/postinst
dpkg-deb -Zxz --build install $APP/build/libfacedetection-aarch64-linux-gnu.deb

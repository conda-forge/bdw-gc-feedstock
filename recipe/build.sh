#!/usr/bin/env bash

CXXFLAGS=$(echo "${CXXFLAGS}" | sed "s/-std=c++17/-std=c++14/g")

if [[ "$target_platform" == "linux-64" ]]; then
  export LIBS='-lrt'
fi

./autogen.sh
./configure --disable-debug --disable-dependency-tracking --prefix=${PREFIX} --enable-cplusplus

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  make check
fi
make install

#!/usr/bin/env bash

CXXFLAGS=$(echo "${CXXFLAGS}" | sed "s/-std=c++17/-std=c++14/g")

./autogen.sh
./configure --disable-debug --disable-dependency-tracking --prefix=${PREFIX} --enable-cplusplus

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" && ${target_platform} != "linux-aarch64" ]]; then
# Skip check on `linux-aarch64` due to segfaults:
# https://src.fedoraproject.org/rpms/gc/blob/rawhide/f/gc.spec#_81
make check
fi
make install

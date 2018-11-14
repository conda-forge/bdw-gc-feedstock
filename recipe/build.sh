#!/usr/bin/env bash

./autogen.sh
./configure --disable-debug --disable-dependency-tracking --prefix=${PREFIX} --enable-cplusplus

CXXFLAGS=$(echo "${CXXFLAGS}" | sed "s/-std=c++17/-std=c++14/g")
make
make check
make install

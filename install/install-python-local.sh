#!/bin/bash
OLDPWD=$PWD
cd /tmp
wget -c "https://www.python.org/ftp/python/3.10.6/Python-3.10.6.tar.xz"
tar -xf Python-3.1*
cd Python-3.10.6
./configure --prefix=$HOME/.local --enable-optimizations --with-ensurepip=install
make -j 4
make install
cd $OLDPWD

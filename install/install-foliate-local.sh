#!/bin/bash
OLDPWD=$PWD
cd /tmp
git clone https://github.com/johnfactotum/foliate.git
cd foliate
meson build --prefix=$HOME/.local
ninja -C build
ninja -C build install
cd $OLDPWD

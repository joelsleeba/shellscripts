#!/bin/bash
if [[ ! $(pip3) ]]; then
    ./install-pip-local.sh
fi

if [[ ! $(meson) ]]; then
    pip3 install meson
fi

if [[ ! $(ninja) ]]; then
    pip3 install ninja
fi

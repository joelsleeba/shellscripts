#!/bin/bash

if [[ ! $(pip3) ]]; then
    if [[ ! $(python3 -m ensure pip --install) ]]; then
        cd /tmp
	wget -c "https://bootstrap.pypa.io/get-pip.py"
        python3 get-pip.py
    fi
else
    echo "pip already installed"
fi

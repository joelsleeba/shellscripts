#!/bin/bash
OLDPWD=$PWD
cd /tmp
if [[ ! $(conda --version) ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
    chmod +x *conda*
    bash Miniconda*
    if [[ $(zsh --version) ]]; then
        conda init zsh
    fi
fi

conda config --set auto_activate_base false

conda install mamba

mamba create -n sage-env sage jupyterlab python=3.10

conda activate sage-env

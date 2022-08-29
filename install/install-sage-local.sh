#!/bin/bash
OLDPWD=$PWD
cd /tmp
if [[ ! $(conda --version) ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh
    chmod +x *conda*
    bash Miniconda*
    source $HOME/.bashrc
    if [[ $(zsh --version) ]]; then
        conda init zsh
	source $HOME/.zshrc
    fi
fi

conda config --set auto_activate_base false
conda update conda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda install -c conda-forge mamba
mamba create -n sage-env sage jupyterlab python=3.10
conda activate sage-env

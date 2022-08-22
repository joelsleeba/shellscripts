wget -c https://github.com/zsh-users/zsh/archive/refs/heads/master.zip -O $HOME/Downloads/zsh.zip
unzip $HOME/Downloads/zsh.zip -d $HOME/Downloads
cd $HOME/Downloads/zsh-master
./Util/preconfig
./configure --prefix=$HOME/.local
make prefix=$HOME/.local all doc info
make prefix=$HOME/.local install
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

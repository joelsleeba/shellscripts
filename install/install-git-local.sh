wget -c https://github.com/git/git/archive/refs/heads/master.zip -O $HOME/Downloads/git.zip
unzip $HOME/Downloads/git.zip -d $HOME/Downloads
cd $HOME/Downloads/git-master
make configure
./configure --prefix=$HOME/.local
make prefix=$HOME/.local all doc info
make prefix=$HOME/.local install

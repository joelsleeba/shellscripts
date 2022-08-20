wget -c https://github.com/git/git/archive/refs/heads/master.zip -O $HOME/Downloads/git.zip
unzip $HOME/Downloads/git.zip -d $HOME/Downloads
cd $HOME/Downloads/git-master
make configure
./configure --prefix=/home/user/.local
make prefix=/home/user/.local all doc info
make prefix=/home/user/.local install

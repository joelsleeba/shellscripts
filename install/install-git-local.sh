OLDPWD=$PWD
wget -c https://github.com/git/git/archive/refs/heads/master.zip -O /tmp/git.zip
unzip /tmp/git.zip -d /tmp
cd /tmp/git-master
make configure
./configure --prefix=$HOME/.local
make prefix=$HOME/.local all doc info
make prefix=$HOME/.local install
cd $OLDPWD

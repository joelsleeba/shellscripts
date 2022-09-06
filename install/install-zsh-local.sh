OLDPWD=$PWD
wget -c https://github.com/zsh-users/zsh/archive/refs/heads/master.zip -O /tmp/zsh.zip
unzip /tmp/zsh.zip -d /tmp
cd /tmp/zsh-master
./Util/preconfig
./configure --prefix=$HOME/.local
make prefix=$HOME/.local all doc info
make prefix=$HOME/.local install
echo "zsh" >> $HOME/.bashrc
source .bashrc
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cd $OLDPWD

OLDPWD=$PWD
cd /tmp
git clone https://github.com/gohugoio/hugo.git
cd hugo
GOBIN=$HOME/.local/bin go install
cd $OLDPWD

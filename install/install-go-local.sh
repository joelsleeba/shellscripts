#!/bin/bash
wget -c https://go.dev/dl/go1.19.linux-amd64.tar.gz -O /tmp/go-linux-amd64.tar.gz
tar -C $HOME/.local -xzf /tmp/go-linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
cat >>$HOME/.profile <<'EOL'
# set PATH so it includes user's private go bin if it exists
if [ -d "$HOME/.local/go/bin" ] ; then
    PATH="$HOME/.local/go/bin:$PATH"
fi
EOL

source $HOME/.profile

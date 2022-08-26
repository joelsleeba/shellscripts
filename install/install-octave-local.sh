cd /tmp
wget https://ftpmirror.gnu.org/octave/octave-7.2.0.tar.gz && \
tar -xzf octave-7.2.0.tar.gz                               && \
cd octave-7.2.0
mkdir .build                            && \
cd    .build                            && \
./../configure --prefix=$HOME/.local/octave && \
make -j2                                && \
make install prefix=$HOME/.local/octave && \

cat >>$HOME/.profile <<'EOL'
# set PATH so it includes user's private octave bin if it exists
if [ -d "$HOME/.local/octave/bin" ] ; then
    PATH="$HOME/.local/octave/bin:$PATH"
fi
EOL

source $HOME/.profile


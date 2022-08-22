cd /tmp
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat install-tl-unx.tar.gz | tar xf -
cd install-tl-*
perl ./install-tl --texdir=$HOME/.local/texlive --scheme=medium --no-interaction
# For a basic installation add --scheme=basic
# minimal < basic < small < medium < tetex < full

cat >>$HOME/.profile <<'EOL'
# set PATH so it includes user's private texlive bin if it exists
if [ -d "$HOME/.local/texlive/bin" ] ; then
    PATH="$HOME/.local/texlive/bin:$PATH"
fi
EOL

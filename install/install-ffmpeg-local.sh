$OLDPWD=PWD
cd /tmp
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
./configure --prefix=$HOME/.local
make 
make install
cd $OLDPWD

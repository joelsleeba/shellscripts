rm -f /data/data/com.termux/files/usr/tmp/.X[0-9]-lock
vncserver -kill :1
vncserver -kill :2
vncserver -kill :3
vncserver :1 -localhost
sshd -p 8022 #I want ssh port at 8022

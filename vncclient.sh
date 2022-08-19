if [[ ! -d $HOME/.ssh ]]
then
    mkdir $HOME/.ssh
fi

KEYFILE=$HOME/.ssh/vipervnc

# change this to your ssh private key
curl -s https://raw.githubusercontent.com/joelsleeba/shellscripts/master/vipervnc > $KEYFILE
chmod 600 $KEYFILE

echo -n "Enter ip address of remote machine:"
read ssh_remote

if [[ $ssh_remote==*":"* ]]
then
    ssh_remote_ip=$(echo $ssh_remote|sed -E 's/(([0-9]{1,3}\.){3}[0-9]{1,3}):([0-9]{1,4})/\1/g')
    ssh_remote_port=$(echo $ssh_remote|sed -E 's/(([0-9]{1,3}\.){3}[0-9]{1,3}):([0-9]{1,4})/\3/g')
else
    ssh_remote_ip=$ssh_remote
    ssh_remote_port=22
fi

ssh -L 5091:localhost:5091 $ssh_remote_ip -p $ssh_remote_port -i $HOME/.ssh/vipervnc

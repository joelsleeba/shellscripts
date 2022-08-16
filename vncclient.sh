if [[ ! -d $HOME/.ssh ]]
then
    mkdir $HOME/.ssh
fi

# change this to your ssh private key
curl https://raw.githubusercontent.com/joelsleeba/shellscripts/master/vipervnc > $HOME/.ssh/vipervnc

echo "Enter ip address of remote machine:"
read ssh_remote

if [[ ssh_remote == *":"* ]]
then
    ssh_remote_ip=$(echo $ssh_remote|sed -E 's/(([0-9]{1,3}\.){3}[0-9]{1,3}):([0-9]{1,4})/\1/g')
    ssh_remote_ip=$(echo $ssh_remote|sed -E 's/(([0-9]{1,3}\.){3}[0-9]{1,3}):([0-9]{1,4})/\3/g')
else
    ssh_remote_ip=$ssh_remote
    ssh_remote_port=22
fi

ssh -L 5091:localhost:5091 $ssh_remote_ip -p $ssh_remote_port -i $HOME/.ssh/vipervnc

read -p "Enter your username:" Name
read -p "Enter your email ID:" MailID
read -p "Do you have SSH keys? (y/n):" IfKey

sshkeygen() {
    KEYNAME="sleeba $(date +"%d-%m-%Y %H:%M:%S")"
    SSHKEY="$HOME/.ssh/$KEYNAME"
    ssh-keygen -t ed25519 -C "unsafe-key" -f "$SSHKEY"
    chmod 600 "$SSHKEY"
    echo -e "\n\nThis is your ssh public key"
    cat "$SSHKEY.pub"
    echo "Access ssh public key in pastebin here:"
    cat "$SSHKEY.pub" | nc termbin.com 9999
    echo -e "\n"
    #ssh-add -t 15 "$SSHKEY"
    export SSHKEY
}

if [[ ! "$IfKey" == "y" ]] && [[ ! "$IfKey"  == "yes" ]]; then
    sshkeygen
fi

git clone git@github.com:joelsleeba/Varsha-2022.git
sleep 10
cd $HOME/Documents/sleeba/Varsha-2022
git config user.name "$Name"
git config user.email "$MailID"
git remote rename origin my-repo
git checkout my-repo/pre-edit
git switch -c pre-edit
git checkout my-repo/source
git switch -c source
git remote add source https://github.com/ashishKujur7/Lecture-Notes.git
git checkout pre-edit

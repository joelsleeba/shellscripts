#!/bin/bash
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
    read -p "Add key to GitHub and press enter:"
    export SSHKEY
}

if [[ ! "$IfKey" == "y" ]] && [[ ! "$IfKey"  == "yes" ]]; then
    sshkeygen
fi

cd $HOME/Documents/sleeba
git clone git@github.com:joelsleeba/Varsha-2022.git
cd Varsha-2022
git config user.name "$Name"
git config user.email "$MailID"
git remote rename origin myrepo
git checkout -b edit myrepo/edit
git checkout -b source myrepo/source
git remote add source https://github.com/ashishKujur7/Lecture-Notes.git
git checkout edit

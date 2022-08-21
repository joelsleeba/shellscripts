sshkeygen() {
    KEYNAME="sleeba $(date +"%d-%m-%Y %H:%M:%S")"
    if [[ ! -e $HOME/.ssh/ ]]; then
        mkdir -p $HOME/.ssh
    fi
    SSHKEY="$HOME/.ssh/$KEYNAME"
    ssh-keygen -t ed25519 -C "unsafe-key" -f "$SSHKEY"
    chmod 600 "$SSHKEY"
    echo -e "\n\nAccess ssh public key in pastebin here:"
    cat "$SSHKEY.pub" | nc termbin.com 9999
    ssh-add -t 15 "$SSHKEY"
    export SSHKEY
}

sshkeygen

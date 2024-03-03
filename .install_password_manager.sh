#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type password-manager-binary >/dev/null 2>&1 && exit

case "$(uname -s)" in
Linux)
    curl -o bw.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux" \
    && sudo dnf install unzip \
    && mkdir $HOME/bin/
    && unzip bw.zip -d $HOME/bin/
    && chmod u+x $HOME/bin/bw
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac

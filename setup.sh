#!/usr/bin/env bash

# CD to script folder
cd "$(dirname "${BASH_SOURCE}")" || exit 1;

# git pull origin master;

function sync() {
	rsync --exclude ".git/" \
        --exclude ".gitmodules" \
		--exclude ".DS_Store" \
		--exclude "setup.sh" \
		--exclude "README.md" \
        --exclude ".bash_it_init" \
		--exclude ".bashrc.tmpl" \
		-avh --no-perms . ~;
}

function gsu() {
    echo "Sync";
    git pull --rebase; 
    git submodule update --init --recursive 
}

function bashItAll() {
    local BASH_IT="$HOME/.bash_it"
    sed "s|{{BASH_IT}}|$BASH_IT|" .bashrc.tmpl  > "$HOME/.bashrc"
    ~/.bash_it/install.sh --silent --no-modify-config
    # Install default parts
}

function doIt() {
    gsu;
    sync;
    bashItAll;
	echo "Load bash profile from $HOME/.bashrc";
	source "$HOME/.bashrc";
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset sync;
unset gsu;
unset bashItAll;
unset doIt;

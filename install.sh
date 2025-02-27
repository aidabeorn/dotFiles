#!/usr/bin/env sh

link_config()
{
    ln -sf "${PWD}/config/$1" "${HOME}/.$1"
}

xdg_link_config()
{
    [ ! -e ~/.config ] && mkdir ~/.config

    ln -sf "${PWD}/config/$1" "${HOME}/.config/$1"
}

link_bin()
{
    [ ! -e ~/bin ] && mkdir ~/bin
    ln -sf "${PWD}/bin/$1" "${HOME}/bin/$1"
}

# Directories
[ ! -e ~/.config/nvim ] && xdg_link_config nvim
[ ! -e ~/.config/kitty ] && xdg_link_config kitty
[ ! -e ~/.config/zellij ] && xdg_link_config zellij
[ ! -e ~/.config/bat ] && xdg_link_config bat

# Deps
if hash git 2>/dev/null; then
    if [ -d ~/.zgen ]; then
        # if Zgen is installed, ensure that it generates a new loader
        rm ~/.zgen/init.zsh
    else
        # install Zgen
        git clone https://github.com/tarjoilija/zgen.git ~/.zgen
    fi
else
    echo >&2 "Git is not installed, zgen and Dynamic Island not installed."
fi

# files
link_config allowed_signers
link_config zshrc
link_config dir_colors
link_config tmux.conf
link_config bashrc
link_config vimrc
link_config gitignore
link_config gitconfig
link_config Xmodmap
link_config oh-my-posh.yaml

# bins
link_bin auth

# If ~/.zsh_local exists, check if the contents of partials/become.zsh are present
if [ -e ~/.zsh_local ]; then
    if ! grep -q "Begin become" ~/.zsh_local; then
        echo "Appending become functions to ~/.zsh_local"
        cat partials/become.zsh >> ~/.zsh_local
    fi
else
    echo "Creating ~/.zsh_local"
    cp partials/become.zsh ~/.zsh_local
fi

echo "#####################"
echo "##   Add GPG key   ##"
echo "#####################"
echo "gpg --full-generate-key"
echo "gpg --import gpg/github.gpg"
echo "gpg --expert --edit-key 5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23 trust"
echo "gpg --expert --edit-key 5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23 sign"

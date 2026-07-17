#!/usr/bin/env bash

git submodule init && git submodule update

ln -frs .bashrc ~/.bashrc
ln -frs .bash_aliases ~/.bash_aliases

mkdir -p ~/.config/nvim
ln -frs .config/nvim/init.vim ~/.config/nvim
ln -frs ~/.config/nvim/init.vim ~/.vimrc
ln -frs .config/nvim/lua ~/.config/nvim/lua
mkdir -p ~/.local/share/nvim/site/pack
ln -frs .local/share/nvim/site/pack/huned ~/.local/share/nvim/site/pack/huned

# tmux catppuccin plugin
mkdir -p ~/.config/tmux/plugins/catppuccin
ln -frs .tmux/catppuccin ~/.config/tmux/plugins/catppuccin/tmux

# btop catppuccin-mocha theme
mkdir -p ~/.config/btop/themes
ln -frs .config/btop/btop.conf ~/.config/btop/btop.conf
ln -frs .btop/catppuccin/themes/catppuccin_mocha.theme ~/.config/btop/themes/catppuccin_mocha.theme

ln -frs .gitconfig ~/.gitconfig
ln -frs .sqliterc ~/.sqliterc
ln -frs .tmux.conf ~/.tmux.conf

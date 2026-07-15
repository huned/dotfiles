#!/usr/bin/env bash

ln -frs .bashrc ~/.bashrc
ln -frs .bash_aliases ~/.bash_aliases

mkdir -p ~/.config/nvim
ln -frs .config/nvim/init.vim ~/.config/nvim
ln -frs ~/.config.nvim/init.vim ~/.vimrc
mkdir -p ~/.local/share/nvim/site/pack
ln -frs .local/share/nvim/site/pack/huned ~/.local/share/nvim/site/pack/huned

ln -frs .gitconfig ~/.gitconfig
ln -frs .sqliterc ~/.sqliterc
ln -frs .tmux.conf ~/.tmux.conf

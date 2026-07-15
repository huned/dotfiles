How to use:

1. Login as user

2. Clone repo

        git clone git@github.com:huned/dotfiles
        cd dotfiles

3. Symlink dotfiles as needed, e.g.

        # bash
        ln -s `pwd`/.bashrc ~/.bashrc
        ln -s `pwd`/.bash_aliases ~/.bash_aliases

        # nvim
        mkdir -p ~/.config/nvim
        ln -s `pwd`/.config/nvim/init.vim ~/.config/nvim
        ln -s ~/.config.nvim/init.vim ~/.vimrc
        mkdir -p ~/.local/share/nvim/site/pack
        ln -s `pwd`/.local/share/nvim/site/pack/huned ~/.local/share/nvim/site/pack/huned

        # Other rc files
        ln -s `pwd`/.gitconfig ~/.gitconfig
        ln -s `pwd`/.sqliterc ~/.sqliterc
        ln -s `pwd`/.tmux.conf ~/.tmux.conf

        # Optional: private stuff
        . ~/.secrets/whatever.secrets

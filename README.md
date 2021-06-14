How to use this:

1. Login as user

2. Clone repo

    git clone git@github.com:huned/dotfiles
    cd dotfiles

3. Symlink dotfiles as needed, e.g.

    # bash
    ln -s `pwd`/.bashrc ~/.bashrc

    # nvim
    mkdir -p ~/.config/nvim
    ln -s `pwd`/.config/nvim/init.vim ~/.config/nvim
    ln -s ~/.config.nvim/init.vim ~/.vimrc
    mkdir -p ~/.local/share/nvim/site/pack
    ln -s `pwd`/.local/share/nvim/site/pack/huned ~/.local/share/nvim/site/pack/huned

    # Other rc files
    ln -s `pwd`/.npmrc ~/.npmrc
    ln -s `pwd`/.toprc ~/.toprc
    ln -s `pwd`/.sqliterc ~/.sqliterc

    # TODO
    .fzf.bash
    .nvm, .nvmrc
    .gconf, .gnome, .
    .inputrc
    .rbenv, .ruby-version

    # TODO private stuff
    ssh keys
    .gist
    .sendgrid-mailrc
    .heropmrc

4. Run post-install script

    ./postinstall.sh

5. Clone working repos and run their install scripts


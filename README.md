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
    mkdir -p ~/.local/share/nvim/site/pack
    ln -s `pwd`/.local/share/nvim/site/pack/huned ~/.local/share/nvim/site/pack/huned

    # TODO
    .fzf.bash
    .gitconfig
    .npmrc
    .nvmrc, .node-version?
    .toprc
    .sqliterc
    .sendgrid-mailrc
    .heropmrc
    .gconf, .gnome, .
    .gist
    .inputrc
    .rbenv, .ruby-version

    ssh keys

4. Run post-install script

    ./postinstall.sh



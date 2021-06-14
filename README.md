How to use:

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
    ln -s `pwd`/.toprc ~/.toprc
    ln -s `pwd`/.gitconfig ~/.gitconfig
    ln -s `pwd`/.sqliterc ~/.sqliterc
    ln -s `pwd`/.nvmrc ~/.nvmrc
    ln -s `pwd`/.npmrc ~/.npmrc
    ln -s `pwd`/.ruby-version ~/.ruby-version

    # Private settings
    # TODO ssh keys
    . ~/.env.secrets

4. Run post-install scripts

    # System-wide modifications
    ./postinstall.sh

    # User-specific modifications
    ./postinstall-user.sh

5. Clone working repos and run their install scripts

    # TODO

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

set runtimepath+=~/.vim

" https://vimawesome.com/plugin/onedark-vim
" installed in ~/.local/share/nvim/site/pack/*/start/onedark-vim
set termguicolors
"see https://github.com/joshdick/onedark.vim/issues/164
call timer_start(0, {-> execute("colorscheme onedark")})

" https://vimawesome.com/plugin/surround-vim
" https://vimawesome.com/plugin/nerdtree-red
" https://vimawesome.com/plugin/fzf
" https://vimawesome.com/plugin/vim-colorschemes-sweeter-than-fiction
" https://vimawesome.com/plugin/sensible-vim
" https://vimawesome.com/plugin/indentline
" https://vimawesome.com/plugin/vim-workspace
" https://vimawesome.com/plugin/command-t-ours
" https://vimawesome.com/plugin/commentary-vim
" https://vimawesome.com/plugin/instant-markdown-vim
" https://vimawesome.com/plugin/tabular
" https://vimawesome.com/plugin/vim-grepper
" https://vimawesome.com/plugin/standard


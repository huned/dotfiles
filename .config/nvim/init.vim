set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=nv                " middle-click paste with mouse
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

" `set list` to show whitespace characters
set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set list

" https://vimawesome.com/plugin/onedark-vim
" installed in ~/.local/share/nvim/site/pack/*/start/onedark-vim
set termguicolors
"colorscheme onedark
"simply calling colorscheme didn't work. see https://github.com/joshdick/onedark.vim/issues/164
call timer_start(0, {-> execute("colorscheme onedark")})

" https://vimawesome.com/plugin/ale
" https://vimawesome.com/plugin/standard
let g:ale_linters = {
\  'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}

" https://vimawesome.com/plugin/commentary-vim
" OK

" https://vimawesome.com/plugin/fzf
" https://github.com/junegunn/fzf
" https://vimawesome.com/plugin/indentline
" https://github.com/voldikss/vim-floaterm
" https://vimawesome.com/plugin/surround-vim
" https://vimawesome.com/plugin/nerdtree-red
" https://vimawesome.com/plugin/vim-grepper
" https://vimawesome.com/plugin/instant-markdown-vim
" https://vimawesome.com/plugin/tabular

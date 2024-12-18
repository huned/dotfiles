" Basic Vim Settings
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets
set ignorecase             " case insensitive matching
set hlsearch               " highlight search results
set tabstop=2              " number of columns occupied by a tab
set softtabstop=2          " see multiple spaces as tabstops
set expandtab              " converts tabs to white space
set shiftwidth=2           " width for autoindents
set autoindent             " indent new lines
set nonumber               " no line numbers by default
set wildmode=longest,list  " bash-like tab completions
set textwidth=80           " 80 column text width
set cc=80                  " 80 column border
set termguicolors         " use true colors
set scrolloff=8            " keep 8 lines above/below cursor
set undofile               " persistent undo
set mouse=a
filetype plugin indent on  " file type based indenting
syntax on                  " syntax highlighting

" Whitespace characters
set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set nolist                 " don't display listchars by default

" Load Lua configurations
lua require('core.colors')
lua require('plugins.fzf')
lua require('core.netrw')
lua require('core.markdown')
lua require('plugins.codecompanion')

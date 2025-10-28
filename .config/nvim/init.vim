" Basic Vim Settings
set nocompatible
filetype plugin indent on
syntax on

" Interface
set nonumber  " no line numbers by default
set termguicolors
set scrolloff=8
"set mouse=a
set showmatch
set noshowmode  " Hide default mode text
set laststatus=2  " Always show status line
set signcolumn=yes  " Always show sign column

" Search
set ignorecase
set smartcase  " Case sensitive if search contains uppercase
set hlsearch
set incsearch  " Show matches while typing

" Indentation
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent

" Text width
set textwidth=80
"set colorcolumn=80 " show a vertical bar at 80 chars

" Files
set undofile
set nobackup
set noswapfile
set hidden  " Allow switching buffers without saving

" Completion
set wildmode=longest,list
set wildmenu  " Enhanced command completion

" Whitespace characters
set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
set nolist

" Performance
set updatetime=300
set timeoutlen=500

" Key mappings
"let mapleader = " "  " Space as leader key

" Load Lua configurations
lua require('core.colors')
lua require('core.netrw')
lua require('core.markdown')
"lua require('plugins.codecompanion')
lua require('plugins.fzf')

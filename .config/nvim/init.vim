" TODOs
" - move environment variables to ~/.bashrc
" - figure out how :tabnew and :FZF play together
" - make myself a quick reference card
" - autocomplete (deoplete? + ultisnips?)
" - tpope/goyo.vim
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
set nolist "don't display listchars by default

" COLOR SCHEME
" ============
"
" https://github.com/rakr/vim-one
set termguicolors " assume truecolor-abled terminal
set background=dark
colorscheme one

" OTHER INSTALLED PLUGINS
" =======================
"
" Enforce standard js style
" https://vimawesome.com/plugin/ale
" https://vimawesome.com/plugin/standard
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}
"
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor --ignore .git --hidden -g ""'
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --border'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
nnoremap <c-p> :Files<CR>
"
" https://github.com/Yggdroot/indentLine
" no additional configuration

" https://github.com/tpope/vim-surround
" no additional configuration

" https://github.com/preservim/nerdtree
nnoremap <c-\> :NERDTreeToggle<CR>

" https://github.com/voldikss/vim-floaterm
" For more configuration ideas/examples, see https://gist.github.com/TheCedarPrince/7b9b51af4c146880f17c39407815b594
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_toggle = '<c-t>'
"let g:floaterm_keymap_new = '<s-c-t>'
"let g:floaterm_keymap_prev = '<s-c-lt>'
"let g:floaterm_keymap_next = '<s-c-gt>'

" https://github.com/mhinz/vim-grepper 
"nnoremap <c-/> :Grepper<CR>
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>
"
" https://github.com/godlygeek/tabular
" no additional configuration

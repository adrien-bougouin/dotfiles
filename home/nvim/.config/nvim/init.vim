""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set termguicolors
source ~/.config/nvim/plugins.vim

set history=100
set mouse=a

set number
set ruler
set cursorline

set incsearch
set showmatch
" set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Processing and Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformats=unix,mac,dos
set fileencoding=utf-8

autocmd BufEnter *.txt set filetype=text
autocmd BufEnter *.tex set filetype=tex

filetype plugin indent on
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab autoindent

" Automatically break lines after 80 characters, for Text and TeX files.
autocmd FileType text setlocal textwidth=80
autocmd FileType tex setlocal textwidth=80

" Highlight trailing whitespaces and text over 80 characters.
highlight DangerZone ctermbg=Red ctermfg=White guibg=Red guifg=White
autocmd BufEnter * match DangerZone /\s\+$\|\%81v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap <C-c> "*y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug (https://github.com/junegunn/vim-plug)
"
" # Installing VimPlug
" ## Vim (~/.vim/autoload):
" ```
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```
"
" ## Neovim (~/.local/share/nvim/site/autoload):
" ```
" $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```
"
" # Installing Plugins
" ```
" :PlugInstall
" ```
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
  " Code Display
  Plug 'lilydjwg/colorizer'

  " Integrations
  Plug 'scrooloose/nerdtree'

  " Interface
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'farmergreg/vim-lastplace'
  Plug 'osyo-manga/vim-over'
  Plug 'lifepillar/vim-solarized8'

  " Language

  " Other
  Plug 'vim-scripts/commentToggle'
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Display
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scrooloose/nerdtree
noremap <C-e> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let g:NERDTreeMouseMode=3
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" junegunn/fzf.vim
map <C-p> :Files<CR>

" itchyny/lightline.vim
map <C-t> :tabnew<CR>
map <PageDown> :tabnext<CR>
map <PageUp> :tabprevious<CR>
" Change the color scheme and prevent tabs from getting resized when their focus
" changes.
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'tabline_separator': { 'left': " ", 'right': "" },
  \ 'tabline_subseparator': { 'left': "|", 'right': "" }
\}

" osyo-manga/vim-over
nmap <C-F> :OverCommandLine<CR>%s/

" lifepillar/vim-solarized8
colorscheme solarized8
set background=light

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

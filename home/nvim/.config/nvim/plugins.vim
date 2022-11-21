""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug (https://github.com/junegunn/vim-plug)
"
" Installing VimPlug:
" ```
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```
"
" Installing plugins:
" ```
" :PlugInstall
" ```
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'farmergreg/vim-lastplace'
  Plug 'junegunn/fzf.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'lilydjwg/colorizer'
  Plug 'vim-scripts/commentToggle'
call plug#end()

" junegunn/fzf.vim
set rtp+=/usr/local/opt/fzf
nmap <Leader>p <cmd>Files<cr>

" lifepillar/vim-solarized8
colorscheme solarized8
set background=light

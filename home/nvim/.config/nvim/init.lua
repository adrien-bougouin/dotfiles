-- :help init

vim.cmd([[
  filetype plugin indent on
  syntax enable
]])

vim.opt.autoindent    = true
vim.opt.backspace     = 'indent,eol,start'
vim.opt.history       = 100
vim.opt.mouse         = 'a'
vim.opt.termguicolors = true

vim.opt.cursorline    = true
vim.opt.number        = true
vim.opt.ruler         = true

vim.opt.expandtab     = true
vim.opt.shiftwidth    = 2
vim.opt.smarttab      = true
vim.opt.softtabstop   = 2
vim.opt.tabstop       = 2

vim.opt.fileencoding  = 'utf-8'
vim.opt.fileformats   = 'unix,mac,dos'

vim.opt.incsearch     = true
vim.opt.showmatch     = true

require('plugins')
require('lsp')
require('highlights')
require('key_bindings')

-- :help lua-vim-opt

vim.cmd("colorscheme vim")

vim.opt.background = "light" -- TODO: set based on terminal background???
vim.opt.termguicolors = false

vim.opt.fileencoding  = "utf-8"
vim.opt.fileformats   = "unix,mac,dos"

vim.opt.cursorline    = true
vim.opt.number        = true
vim.opt.ruler         = true

vim.opt.history       = 100
vim.opt.mouse         = "a"

vim.opt.incsearch     = true
vim.opt.showmatch     = true

vim.opt.autoindent    = true
vim.opt.backspace     = "indent,eol,start"

vim.opt.expandtab     = true
vim.opt.shiftwidth    = 2
vim.opt.smarttab      = true
vim.opt.softtabstop   = 2
vim.opt.tabstop       = 2

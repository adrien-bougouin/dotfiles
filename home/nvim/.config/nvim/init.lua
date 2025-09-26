-- :help init

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.background = "light"
vim.cmd.colorscheme("host")

require("options")
require("plugins")
require("highlights")
require("keymaps")
require("lsp")

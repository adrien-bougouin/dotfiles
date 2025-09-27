-- :help init

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.cmd.colorscheme("vim")

require("options")
require("plugins")
require("highlights")
require("keymaps")
require("lsp")

-- :help init

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require("options")
require("highlights")

vim.cmd.colorscheme("vim")

require("plugins")
require("keymaps")
require("lsp")

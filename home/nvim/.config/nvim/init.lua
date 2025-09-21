-- :help init

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set default colorscheme based on terminal colorscheme
vim.cmd("colorscheme vim")

require("options")
require("plugins")
require("highlights")
require("keymaps")
require("lsp")

-- Set Solarized colorscheme, if available
local colorscheme =
  vim.fn.getcompletion("solarized-flat", "color")[1]
if colorscheme then
  vim.opt.termguicolors = true

  vim.cmd(string.format("colorscheme %s", colorscheme))
end

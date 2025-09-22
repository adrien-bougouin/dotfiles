-- :help init

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set fallback color scheme based on terminal color scheme.
vim.cmd("colorscheme vim")

require("options")
require("plugins")

-- Set Solarized color scheme, if available (must be done before importing
-- the custom highlights).
local colorscheme =
  vim.fn.getcompletion("solarized-flat", "color")[1]
if colorscheme then
  vim.opt.termguicolors = true

  vim.cmd(string.format("colorscheme %s", colorscheme))
end

require("highlights")
require("keymaps")
require("lsp")

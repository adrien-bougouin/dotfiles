local Notifier = require("utils/notifier")

-- Bootstrap lazy.nvim for plugin management
local LAZY_PATH = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local LAZY_REPO = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(LAZY_PATH) then
  local install_output = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", LAZY_REPO, LAZY_PATH })

  if vim.v.shell_error ~= 0 then
    Notifier.error("Failed to install 'lazy.nvim': " .. install_output)
  end
end

vim.opt.rtp:prepend(LAZY_PATH)

-- Plugins

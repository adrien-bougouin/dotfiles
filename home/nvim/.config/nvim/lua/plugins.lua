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

-- Install plugins
local lazy_installed, lazy = pcall(require, "lazy")

if lazy_installed then
  lazy.setup({
    install = { colorscheme = { "default" } },
    spec = {
      { "gpanders/editorconfig.nvim" },
      {
        "ibhagwan/fzf-lua",
        config = function()
          require('fzf-lua').setup({
            winopts = {
              preview = {
                layout = 'vertical',
                vertical = 'up:66%'
              }
            },
            fzf_opts = {
              ['--layout'] = 'reverse-list',
            }
          })
        end
      },
      {
        "NvChad/nvim-colorizer.lua",
        config = function()
          require('colorizer').setup()
        end
      },
      {
        "terrortylor/nvim-comment",
        config = function ()
          require('nvim_comment').setup({create_mappings = false})
        end
      },
      {
        "ethanholz/nvim-lastplace",
        config = function()
          require('nvim-lastplace').setup({
            lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
            lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
            lastplace_open_folds = true
          })
        end
      },
      { "neovim/nvim-lspconfig" },
      {
        "ishan9299/nvim-solarized-lua",
        config = function ()
          vim.opt.background = "light"
          vim.cmd("colorscheme solarized")
        end
      }
    }
  })
else
  Notifier.warning("Failed to load plugin manager 'lazy.nvim'. Plugins won't work.")
end

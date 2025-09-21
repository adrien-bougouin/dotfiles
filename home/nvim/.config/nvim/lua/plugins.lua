local Notifier = require("utils/notifier")

-- Bootstrap lazy.nvim for plugin management
local LAZY_PATH = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local LAZY_REPO = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(LAZY_PATH) then
  local install_output = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", LAZY_REPO, LAZY_PATH })

  if vim.v.shell_error ~= 0 then
    Notifier.error("Failed to install 'lazy.nvim'. " .. install_output)
  end
end

vim.opt.rtp:prepend(LAZY_PATH)

-- Install plugins
local lazy_installed, lazy = pcall(require, "lazy")

if lazy_installed then
  lazy.setup({
    spec = {
      {
        "ibhagwan/fzf-lua",
        opts = {
          winopts = {
            preview = {
              layout = "vertical",
              vertical = "up:66%"
            }
          },
          fzf_opts = {
            ["--layout"] = "reverse-list",
          }
        }
      },
      -- Reopens file at the last viewed line
      {
        "ethanholz/nvim-lastplace",
        opts = {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
          lastplace_open_folds = true
        }
      },
      -- Injects default LSP settings
      { "neovim/nvim-lspconfig" },
      {
        "ishan9299/nvim-solarized-lua",
        config = function ()
          vim.cmd("colorscheme solarized")

          vim.opt.termguicolors = true
        end
      },
      {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
            incremental_selection = { enable = true },
            indent = { enable = true }
          })
        end
      },
      -- Shows hidden scope declaration on top
      {
        "nvim-treesitter/nvim-treesitter-context"
      }
    }
  })
else
  Notifier.warning("Failed to load plugin manager 'lazy.nvim'. Plugins won't work.")
end

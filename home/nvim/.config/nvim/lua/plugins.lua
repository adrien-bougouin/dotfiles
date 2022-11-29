-- Plugin management with Packer (https://github.com/wbthomason/packer.nvim).
--
-- Intalling Packer:
-- ```
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim \
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim && \
--   nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
-- ```
--
-- Installing plugins:
-- ```
-- :PackerCompile
-- :PackerInstall
-- ```
--
-- Update plugins:
-- ```
-- :PackerUpdate
-- ```
--
-- Removing unused plugins:
-- ```
-- :PackerClean
-- ```

local plugin_setups = {
  -- Packer manages itself.
  ['wbthomason/packer.nvim'] = function()
    vim.cmd([[
      augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
  end,

  ['gpanders/editorconfig.nvim'] = function() end,
  ['ibhagwan/fzf-lua'] = function() end,
  ['NvChad/nvim-colorizer.lua'] = function()
    require('colorizer').setup()
  end,
  ['terrortylor/nvim-comment'] = function()
    require('nvim_comment').setup({create_mappings = false})
  end,
  ['ethanholz/nvim-lastplace'] = function()
    require('nvim-lastplace').setup({
      lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
      lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
      lastplace_open_folds = true
    })
  end,
  ['neovim/nvim-lspconfig'] = function() end,
  ['ishan9299/nvim-solarized-lua'] = function()
    vim.cmd('colorscheme solarized')
    vim.opt.background = 'light'
  end
}

if pcall(require, 'packer') then
  return require('packer').startup(
    function(use)
      for plugin, setup in pairs(plugin_setups) do
        use(plugin)
        if not pcall(setup) then
          vim.notify(string.format("Something whent wrong setting up plugin '%s'. Try running `:PackerSync`.", plugin))
        end
      end
    end
  )
else
  vim.notify("'packer' plugin manager not found. Plugins won't work.")
end

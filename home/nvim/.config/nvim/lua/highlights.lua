-- :help nvim_set_hl
-- :help nvim_create_autocmd

-- Custom highlights
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd([[call matchadd("TrailingWhitespaces", "\\s\\+$")]])
    vim.cmd([[call matchadd("LineOverflow", "\\%81v.\\+")]])
  end
})

-- Custom highlights styles
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TrailingWhitespaces", { sp = "Red", undercurl = true })
    vim.api.nvim_set_hl(0, "LineOverflow", { sp = "Red", undercurl = true })
  end
})

-- "vim" colorscheme overrides
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "vim",
  callback = function()
  -- Original LightGrey (7) setting is not easily readable.
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "Black", ctermfg = 0 })
  end
})

-- :help nvim_set_hl
-- :help nvim_create_autocmd

-- Override some "vim" colorscheme highlights
if vim.g.colors_name == "vim" then
  -- Original LightGrey (7) setting is not easily readable.
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "Black", ctermfg = 0 })
end

-- Show trailing whitespaces
vim.api.nvim_set_hl(0, "TrailingWhitespaces", { sp = "Red", undercurl = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[call matchadd("TrailingWhitespaces", "\\s\\+$")]]
})

-- Show when a line is exceeding 80 characters.
vim.api.nvim_set_hl(0, "LineOverflow", { sp = "Red", undercurl = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[call matchadd("LineOverflow", "\\%81v.\\+")]]
})

-- TODO: also apply to floats
-- Prevent matches to affect the FZF popups
--
-- https://www.reddit.com/r/neovim/comments/l2qur6/how_to_get_rid_of_highlight_artifacts_in_fzf_popup/
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = "*",
  command = "call clearmatches()"
})

-- :help nvim_create_autocmd

-- Show trailing whitespaces
vim.cmd("highlight TrailingWhitespaces cterm=undercurl gui=undercurl guisp=Red")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[call matchadd("TrailingWhitespaces", "\\s\\+$")]]
})

-- Show when a line is exceeding 80 characters.
vim.cmd("highlight LineOverflow cterm=undercurl gui=undercurl guisp=Red")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = [[call matchadd("LineOverflow", "\\%81v.\\+")]]
})

-- Prevent highlights to affect the FZF popups
--
-- https://www.reddit.com/r/neovim/comments/l2qur6/how_to_get_rid_of_highlight_artifacts_in_fzf_popup/
vim.api.nvim_create_autocmd("TermEnter", {
  pattern = "*",
  command = "call clearmatches()"
})

-- :help nvim_create_autocmd

-- Show when a line is exceeding 80 characters.
vim.cmd('highlight LineOverflow ctermbg=Red ctermfg=White guibg=Red guifg=White')
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = [[match LineOverflow /\s\+$\|\%81v.\+/]]
})
-- https://www.reddit.com/r/neovim/comments/l2qur6/how_to_get_rid_of_highlight_artifacts_in_fzf_popup/
vim.api.nvim_create_autocmd('TermEnter', {
  pattern = '*',
  command = 'call clearmatches()'
})

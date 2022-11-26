-- Tab management.
vim.api.nvim_set_keymap('n', 'tt', ':tabnew<CR>', {})
vim.api.nvim_set_keymap('n', 'tr', ':tabprevious<CR>', {})
vim.api.nvim_set_keymap('n', 'ty', ':tabnext<CR>', {})

-- System clipboard management.
vim.api.nvim_set_keymap('v', '<C-S-c>', '"*y', {})

-- FZF plugin controls.
if pcall(require, 'fzf-lua') then
  vim.api.nvim_set_keymap('n', '<Leader>p', ':FzfLua files<CR>', {})
  vim.api.nvim_set_keymap('n', '<Leader><S-p>', ':FzfLua git_files<CR>', {})
else
  vim.notify("FZF key bindings won't work. fzf-lua plugin not found.")
end

-- Comment plugin controls.
if pcall(require, 'nvim_comment') then
  vim.api.nvim_set_keymap('n', '<Leader>;', ':CommentToggle<CR>', {})
  vim.api.nvim_set_keymap('v', '<Leader>;', ":CommentToggle<CR>", {})
else
  vim.notify("Commenting key bindings won't work. nvim_comment plugin not found.")
end

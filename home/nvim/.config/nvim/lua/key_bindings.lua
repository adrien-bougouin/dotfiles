vim.g.mapleader = ' ' -- <leader> = <space>

-- Tab management.
vim.keymap.set('n', '<leader>tt', ':tabnew<cr>', {})
vim.keymap.set('n', '<leader>tr', ':tabprevious<cr>', {})
vim.keymap.set('n', '<leader>ty', ':tabnext<cr>', {})

-- System clipboard management.
vim.keymap.set('v', '<C-S-c>', '"*y', {})
vim.keymap.set('i', '<C-S-v>', '<esc>"*pa', {})

-- FZF plugin controls.
if pcall(require, 'fzf-lua') then
  vim.keymap.set('n', '<leader>p', ':FzfLua files<cr>', {})
  vim.keymap.set('n', '<leader><S-p>', ':FzfLua git_files<cr>', {})
else
  vim.notify("'fzf-lua' plugin not found. Fuzzy finding key bindings won't work.")
end

-- Comment plugin controls.
if pcall(require, 'nvim_comment') then
  vim.keymap.set('n', '<leader>;', ':CommentToggle<cr>', {})
  vim.keymap.set('v', '<leader>;', ":CommentToggle<cr>", {})
else
  vim.notify("'nvim_comment' plugin not found. Commenting key bindings won't work.")
end

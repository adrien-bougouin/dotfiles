-- :help mapleader
-- :help lua-keymap

vim.g.mapleader = ' ' -- <leader> = <space>

-- Tab management.
vim.keymap.set('n', '<leader>t', ':tabnew<cr>', {})
vim.keymap.set('n', '[[', ':tabprevious<cr>', {})
vim.keymap.set('n', ']]', ':tabnext<cr>', {})

-- System clipboard management.
vim.keymap.set('v', '<C-S-c>', '"*y', {})
vim.keymap.set('i', '<C-S-v>', '<esc>"*pa', {})

-- FZF plugin controls.
if pcall(require, 'fzf-lua') then
  vim.keymap.set('n', '<leader>f', ':FzfLua files<cr>', {})
  vim.keymap.set('n', '<leader><S-f>', ':FzfLua git_files<cr>', {})
  vim.keymap.set('n', '<leader>b', ':FzfLua buffers<cr>', {})
else
  vim.notify("'fzf-lua' plugin not found. Fuzzy finding key bindings won't work.")
end

-- Comment plugin controls.
if pcall(require, 'nvim_comment') then
  vim.keymap.set('n', ';;', ':CommentToggle<cr>', {})
  vim.keymap.set('v', ';;', ":CommentToggle<cr>", {})
else
  vim.notify("'nvim_comment' plugin not found. Commenting key bindings won't work.")
end

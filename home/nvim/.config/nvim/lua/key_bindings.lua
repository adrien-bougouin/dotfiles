-- :help lua-keymap

vim.g.mapleader = ' ' -- <leader> = <space>

-- Tab management.
vim.keymap.set('n', '<C-t>', ':tabnew<cr>', {})
vim.keymap.set('i', '<C-t>', '<esc>:tabnew<cr>', {})

-- System clipboard management.
vim.keymap.set('v', '<C-S-c>', '"*y', {})
vim.keymap.set('i', '<C-S-v>', '<esc>"*pa', {})

-- FZF plugin controls.
if pcall(require, 'fzf-lua') then
  vim.keymap.set('n', '<C-f>', ':FzfLua files<cr>', {})
  vim.keymap.set('n', '<C-S-f>', ':FzfLua git_files<cr>', {})
  vim.keymap.set('n', '<C-b>', ':FzfLua buffers<cr>', {})
  vim.keymap.set('n', '<C-g>', ':FzfLua live_grep_resume<cr>', {})

  vim.keymap.set('i', '<C-f>', '<esc>:FzfLua files<cr>', {})
  vim.keymap.set('i', '<C-S-f>', '<esc>:FzfLua git_files<cr>', {})
  vim.keymap.set('i', '<C-b>', '<esc>:FzfLua buffers<cr>', {})
  vim.keymap.set('i', '<C-g>', '<esc>:FzfLua live_grep_resume<cr>', {})
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

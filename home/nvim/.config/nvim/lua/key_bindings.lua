-- :help lua-keymap

local Notifier = require("utils/notifier")

-- Tab management
vim.keymap.set("n", "<leader>tT", ":tabnew<cr>:tabm -1<cr>", {})
vim.keymap.set("n", "<leader>tt", ":tabnew<cr>", {})

-- System clipboard management
vim.keymap.set("n", "<leader>yy", '"*yy', {})
vim.keymap.set("n", "<leader>p", '"*p', {})
vim.keymap.set("n", "<leader><S-p>", '"*P', {})
vim.keymap.set("v", "<leader>y", '"*y', {})
vim.keymap.set("v", "<leader>p", '"*p', {})
vim.keymap.set("v", "<leader><S-p>", '"*P', {})

-- FZF plugin controls
if pcall(require, "fzf-lua") then
  vim.keymap.set("n", "<leader>ff", ":FzfLua files<cr>", {})
  vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<cr>", {})
  vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<cr>", {})
  vim.keymap.set("n", "<leader>fh", ":FzfLua help_tags<cr>", {})
else
  Notifier.warning("'fzf-lua' plugin not found. Fuzzy finding key bindings won't work.")
end

-- Comment plugin controls
if pcall(require, "nvim_comment") then
  vim.keymap.set("n", "<leader>;", ":CommentToggle<cr>", {})
  vim.keymap.set("v", "<leader>;", ":CommentToggle<cr>", {})
else
  Notifier.warning("'nvim_comment' plugin not found. Commenting key bindings won't work.")
end

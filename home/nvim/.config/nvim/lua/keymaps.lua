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

-- Open diagnostics keymap override to open as unfocusable float, preventing the
-- cursor from going inside the float and appearing stuck (must press "q" to
-- exit the float).
vim.keymap.set(
  "n", "<C-w>d", function()
    vim.diagnostic.open_float({ focusable = false })
  end
)

-- FZF plugin controls
if pcall(require, "fzf-lua") then
  vim.keymap.set("n", "<leader>ff", ":FzfLua files<cr>", {})
  vim.keymap.set("n", "<leader>fb", ":FzfLua buffers<cr>", {})
  vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<cr>", {})
  vim.keymap.set("n", "<leader>fh", ":FzfLua help_tags<cr>", {})

  vim.keymap.set("n", "<leader>tF", ":tabnew<cr>:tabm -1<cr>:FzfLua files<cr>", {})
  vim.keymap.set("n", "<leader>tf", ":tabnew<cr>:FzfLua files<cr>", {})
  vim.keymap.set("n", "<leader>tB", ":tabnew<cr>:tabm -1<cr>:FzfLua buffers<cr>", {})
  vim.keymap.set("n", "<leader>tb", ":tabnew<cr>:FzfLua buffers<cr>", {})
  vim.keymap.set("n", "<leader>tG", ":tabnew<cr>:tabm -1<cr>:FzfLua live_grep<cr>", {})
  vim.keymap.set("n", "<leader>tg", ":tabnew<cr>:FzfLua live_grep<cr>", {})
else
  Notifier.warning("'fzf-lua' plugin not found. Fuzzy finding key bindings won't work.")

  vim.keymap.set("n", "<leader>ff", ":Explore<cr>", {})
  vim.keymap.set("n", "<leader>fb", ":ls<cr>", {})
  vim.keymap.set("n", "<leader>fg", ":vimgrep ", {})

  vim.keymap.set("n", "<leader>tF", ":tabnew<cr>:tabm -1<cr>:Explore<cr>", {})
  vim.keymap.set("n", "<leader>tf", ":tabnew<cr>:Explore<cr>", {})
  vim.keymap.set("n", "<leader>tB", ":tabnew<cr>:tabm -1<cr>:ls<cr>", {})
  vim.keymap.set("n", "<leader>tb", ":tabnew<cr>:ls<cr>", {})
  vim.keymap.set("n", "<leader>tG", ":tabnew<cr>:tabm -1<cr>:vimgrep", {})
  vim.keymap.set("n", "<leader>tg", ":tabnew<cr>:vimgrep ", {})
end

-- :help lspconfig-all

local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
local lsp_servers = {
  'sumneko_lua',   -- Lua
  'rust_analyzer', -- Rust
  'solargraph'     -- Ruby
}

local on_attach = function(_, buffer)
  local keymap_options = { noremap = true, silent = true, buffer = buffer }

  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_options)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_options)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_options)

  vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, keymap_options)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, keymap_options)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, keymap_options)

  vim.api.nvim_buf_create_user_command(buffer, 'Format', function()
    vim.lsp.buf.format { async = true }
  end, {})
end

if has_lspconfig then
  for _, lsp_server in ipairs(lsp_servers) do
    lspconfig[lsp_server].setup({
      on_attach = on_attach
    })
  end
else
  vim.notify("'lsp-config' plugin not found. Some diagnostics and key bindings won't work.")
end

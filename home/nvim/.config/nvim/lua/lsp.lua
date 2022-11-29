local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
local lsp_servers = {
  'rust_analyzer',  -- Rust
  'solargraph'      -- Ruby
}

local on_attach = function(client, buffer)
  local bufopts = { noremap = true, silent = true, buffer = buffer }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, bufopts)

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

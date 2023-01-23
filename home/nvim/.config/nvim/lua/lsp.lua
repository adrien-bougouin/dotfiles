-- :help lspconfig-all

local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
local lsp_servers = {
  'rust_analyzer',
  'solargraph',  -- Ruby
  'sumneko_lua', -- Lua
}

local open_diagnostic = function()
  vim.diagnostic.open_float({ scope = 'cursor', focusable = false })
end

local on_attach = function(_, buffer)
  local keymap_options = { noremap = true, silent = true, buffer = buffer }

  -- Keep showing the colomn for dignostics' signs, to prevent text from moving
  -- when it is shown/hid.
  vim.opt.signcolumn = 'yes'

  -- Disable diagnostic text that is mixed with lines of code.
  vim.diagnostic.config({
    virtual_text = false
  })

  vim.o.updatetime = 250
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = buffer,
    callback = open_diagnostic
  })

  vim.api.nvim_buf_create_user_command(buffer, 'Format', function()
    vim.lsp.buf.format { async = true }
  end, {})

  vim.keymap.set('n', '<leader>d', open_diagnostic, keymap_options)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_options)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_options)

  vim.keymap.set('n', '<leader><space>', vim.lsp.buf.hover, keymap_options)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, keymap_options)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, keymap_options)
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

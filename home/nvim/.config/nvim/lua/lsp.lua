local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
local lsp_servers = {
  'rust_analyzer',  -- Rust
  'solargraph'      -- Ruby
}

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- TODO: LSP key mappings
end

if has_lspconfig then
  for _, lsp_server in ipairs(lsp_servers) do
    lspconfig[lsp_server].setup({
      on_attach = on_attach
    })
  end
end

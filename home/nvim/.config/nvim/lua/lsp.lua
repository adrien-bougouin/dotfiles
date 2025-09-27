-- :help lsp

vim.lsp.enable("harper_ls")     -- Grammar checker

vim.lsp.enable("lua_ls")        -- Lua
vim.lsp.enable("rust_analyzer") -- Rust
vim.lsp.enable("solargraph")    -- Ruby
vim.lsp.enable("ts_ls")         -- TypeScript
vim.lsp.enable("vue_ls")        -- Vue

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Prevent the completion from filling the line with the first suggestion.
    vim.cmd("set completeopt+=noselect")

    -- Always show the sign column when a language server is active, preventing
    -- it from showing/hiding every time there is/isn't an LSP diagnostic.
    vim.opt.signcolumn = "yes"

    vim.diagnostic.config({
      update_in_insert = false,
      virtual_text = false,
      virtual_lines = false
    })
  end
})

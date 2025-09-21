-- :help lsp

vim.lsp.enable("harper")        -- Grammar checker

vim.lsp.enable("lua_ls")        -- Lua
vim.lsp.enable("rust_analyzer") -- Rust
vim.lsp.enable("solargraph")    -- Ruby
vim.lsp.enable("ts_ls")         -- Typescript
vim.lsp.enable("vue_ls")        -- Vue

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- When inputing trigger characters such as "." or "->", automatically
    -- trigger autocompletion.
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- When showing completion, do not automatically write the first choice in
    -- the buffer.
    vim.cmd("set completeopt+=noselect")

    -- When there is no diagnostics to show, prevent the diagnostic column from
    -- hiding, which makes text move.
    vim.opt.signcolumn = "yes"

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = { current_line = true }
    })
  end
})

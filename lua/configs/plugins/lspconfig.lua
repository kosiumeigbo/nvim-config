-- Mason default Config
require("mason").setup({})

-- Mason LSP Config
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "tailwindcss", "html", "jsonls", "lua_ls", "harper_ls", "yamlls" },
})

-- Neovim LSP Config
local lspconfig = require("lspconfig")

local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", {})

local onGoToDefinition = function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end

local onGoToTypeDefinition = function()
  vim.cmd("vsplit")
  vim.lsp.buf.type_definition()
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = lspgroup,
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gd", onGoToDefinition, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "rs", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gt", onGoToTypeDefinition, opts)

    -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --	callback = function()
    --	vim.lsp.buf.hover()
    --end,
    --		})
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(event)
    vim.api.nvim_clear_autocmds({ buffer = args.buf })
  end,
})

lspconfig.ts_ls.setup({})

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {"ts_ls", "tailwindcss", "html", "jsonls", "lua_ls", "harper_ls", "yamlls"}
})

local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({})

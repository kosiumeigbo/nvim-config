-- Mason default Config
require("mason").setup({})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd([[Mason]])
  end,
})

-- Mason LSP Config
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "tailwindcss", "html", "jsonls", "lua_ls", "harper_ls", "yamlls", "eslint", "emmet_ls" },
})

-- Capabilities to attach to individual LSP setups
-- From "cmp_nvim_lsp"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Luasnip setup
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
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
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(event)
    vim.api.nvim_clear_autocmds({ buffer = event.buf })
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = true,
  severity_sort = true,
})

-- Individual LSP Setups
lspconfig.ts_ls.setup({ capabilities = capabilities })

lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
    },
  },
  capabilities = capabilities,
})

lspconfig.html.setup({ capabilities = capabilities })

lspconfig.jsonls.setup({ capabilities = capabilities })

lspconfig.lua_ls.setup({ capabilities = capabilities })

lspconfig.yamlls.setup({ capabilities = capabilities })

lspconfig.eslint.setup({ capabilities = capabilities })

lspconfig.emmet_ls.setup({ capabilities = capabilities })

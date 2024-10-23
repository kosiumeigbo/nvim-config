vim.g.neoformat_try_node_exe = 1

vim.api.nvim_create_autocmd({"BufWritePre", "TextChanged", "InsertLeave"}, {
  pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "*.html", "*.css"},
  command = "Neoformat prettier"
})

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><Left>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><Right>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><Down>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><Up>", { desc = "Move focus to upper window" })

-- Tab functions (DOES NOT WORK IN A NEOTREE WINDOW)
vim.keymap.set("n", "ts", "<cmd>tab<Space>split<CR>", { desc = "Open current buffer in a new tabpage" })
vim.keymap.set("n", "tt", "<cmd>tabnew<CR>", { desc = "Open whole new empty tabpage" })
vim.keymap.set("n", "tc", "<cmd>tabclose<CR>", { desc = "Close current tabpage" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><Left>", { desc = "Move focus to window to the [L]eft" })
vim.keymap.set("n", "<C-l>", "<C-w><Right>", { desc = "Move focus to window to the [R]ight" })
vim.keymap.set("n", "<C-j>", "<C-w><Down>", { desc = "Move focus to window [B]elow" })
vim.keymap.set("n", "<C-k>", "<C-w><Up>", { desc = "Move focus to window [A]bove" })

-- Window creation
-- vim.keymap.set("n", "wl", "<cmd>vsplit<CR>", { desc = "Split [W]indow [R]ight" })
-- vim.keymap.set("n", "wj", "<cmd>split<CR>", { desc = "Split [W]indow [B]elow" })

-- Tab functions (DOES NOT WORK IN A NEOTREE WINDOW)
vim.keymap.set("n", "ts", "<cmd>tab<Space>split<CR>", { desc = "[S]plit current buffer in a new tabpage" })
vim.keymap.set("n", "tt", "<cmd>tabnew<CR>", { desc = "Open whole new emp[T]y [T]abpage" })
vim.keymap.set("n", "tc", "<cmd>tabclose<CR>", { desc = "Close [C]urrent tabpage" })
vim.keymap.set("n", "tn", "<cmd>tabnext<CR>", { desc = "Open [N]ext tabpage" })
vim.keymap.set("n", "tp", "<cmd>tabprevious<CR>", { desc = "Open [P]revious tabpage" })

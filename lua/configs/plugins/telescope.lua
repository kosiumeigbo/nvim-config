local builtin = require("telescope.builtin")

-- File Pickers
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Neovim LSP Pickers
vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Telescope LSP diagnostics" })

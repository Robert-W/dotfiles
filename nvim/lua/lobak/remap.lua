-- Non-plugin related mappings
-- Plugin specific mappings are in after/plugin/*.lua

-- Paste but keep paste contents in paste register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste and keep contents in register' })

-- Yank enhancements
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "<leader>y", [["+y]], { desc = 'Copy the highlighted content to clipboard' })
vim.keymap.set("n", "<leader>f", ":let @+=expand('%')<CR>", { desc = 'Copy current buffer filename to clipboard' })

-- Keep the screen centered on the cursor when moving around
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix list enhancements
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- shortcut to make the current file executable
vim.keymap.set("n", "<leader>x", ":silent !chmod +x %<CR>", { desc = 'Make the current file executable' })

-- Convenient ways to move text in different modes
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { desc = 'Move current line down' })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { desc = 'Move current line up' })

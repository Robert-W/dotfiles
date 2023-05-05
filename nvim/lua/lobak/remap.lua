-- Paste but keep paste contents in paste register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank enhancements
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Keep the screen centered on the cursor when moving around
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quickfix list enhancements
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Convenient ways to move text in different modes
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==")
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==")
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")

-- Create vertical split and open netrw
vim.keymap.set("n", ";rw", ":wincmd v<bar> :Ex<bar> :vertical resize 30<bar> :wincmd l<CR>")
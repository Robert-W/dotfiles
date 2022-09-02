local Remap = require("lobak.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

-- Capitol Y copy til end of line, versus whole line
nnoremap("Y", "y$")

-- Keep the screen centered on the cursor when going to next, previous, etc
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Insert undo breakpoints when encountering certain characters
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")

-- Convenient way to move text in different modes
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
inoremap("<C-j>", "<esc>:m .+1<CR>==")
inoremap("<C-k>", "<esc>:m .-2<CR>==")
nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")

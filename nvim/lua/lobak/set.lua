vim.g.mapleader = " "

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Options needed for current companies development setup
vim.opt.eol = false
vim.opt.fixeol = false

-- Options for the indentline plugin
vim.opt.list = true
-- vim.opt.listchars:append 'space:⋅'

-- vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.title = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.errorbells = false

vim.opt.cmdheight = 1
vim.opt.scrolloff = 8
vim.opt.textwidth = 80
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
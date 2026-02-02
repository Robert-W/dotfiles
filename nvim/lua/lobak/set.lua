vim.g.mapleader = " "

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Confirm close unsaved buffers
vim.opt.confirm = true

-- Configure how we represent whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Options needed for current companies development setup
vim.opt.eol = false
vim.opt.fixeol = false

-- vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Command line search options
vim.opt.cmdheight = 1
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- Editor options
vim.opt.title = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.textwidth = 80
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'

-- Convert tabs to 2 spaces on save
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Configure Diagnositcs
vim.diagnostic.config({
  float = { border = 'rounded' },
  severity_sort = true,
  virtual_text = true
})

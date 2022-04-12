" General Settings to apply
syntax enable

set nocompatible
set title
set ruler
set number
set nobackup
set showcmd
set hlsearch
set ignorecase
set cmdheight=1
set laststatus=2
set scrolloff=10
set signcolumn=yes

set smarttab
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set background=dark
set completeopt=menu,menuone,noinsert,noselect

" Remaps to apply

" Capitol Y copy til end of line, versus whole line
nnoremap Y y$

" Keep the screen centered on the cursor when going to next, previous, etc
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJ`z

" Insert undo breakpoints when encountering certain characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Convenient way to move text in different modes
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

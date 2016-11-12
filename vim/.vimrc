filetype plugin indent on
syntax on

"Pathogen
call pathogen#infect()
call pathogen#helptags()

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']

"vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

set hidden "hide buffers instead of closing them
set incsearch "show search matches as you type
set autoindent "autoindent on return
set copyindent "copy previous indentation on autoindent
set ruler "show cursor position
set number "add linenumbers by default
set noswapfile "dont make a swap file
set wildmenu "autocomplete for vim commands
set showmatch "show matching parenthesis
set hlsearch "highlight search terms
set smartcase "ignore case if search pattern is all lowercase
set visualbell "dont beep

set tabstop=2 "make tabs 2 spaces
set shiftwidth=2 "number of spaces for autoindenting
set encoding=utf8 "set standard encoding
set background=dark "set background color
set backspace=indent,eol,start "allow backspacing over everything in insert mode

set autoread


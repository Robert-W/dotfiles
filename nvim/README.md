# Neovim Setup
NVIM configurations as of 10/28/21

## Core requirements
- Python 3
- Homebrew

## Python packages
- `pip3 install pynvim`

## Brew packages
- `brew install --HEAD neovim luajit`
- `brew install ripgrep iterm2`

## Directory structure
Copy the following files and directories from this repo into `~/.config/nvim`:
- `init.vim`
- `settings.vim`
- `vim-plug`
- `plug-config`

## Nvim commands
Once all the files are in place, open up any file with `nvim` and run the following:
- `:PlugInstall`: Installs plugins
- `:LSPInstall rust_analyzer tsserver cssls html terraformls jsonls`: Install language servers
- `:TSInstall rust javascript typescript css html json scss yaml`: Install treesitter modules

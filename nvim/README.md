# Neovim Setup
NVIM configurations as of 10/10/23

## Core requirements
- Python 3
- Homebrew

## Python packages (might not need anymore)
- `pip3 install pynvim`

## Brew packages
- `brew install --HEAD neovim luajit`
- `brew install ripgrep`

## Clone and Link configuration files
- `git clone git@github.com:Robert-W/dotfiles.git`
- `ln -s "$(pwd)/nvim" ~/.config/nvim`

### ARM64 Mac Users
When running Treesitter update/install for language servers. If you are on an
arm64 MAC you may get some errors about the architecture being incorrect. In
that case, you need to uninstall all the `*.so` files and re-open nvim on Macs
native terminal. This will install/re-compile the correct language servers.

Current path to the `*.so` files:
- `~/.local/share/nvim/lazy/nvim-treesitter/parser/`
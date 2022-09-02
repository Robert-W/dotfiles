# Neovim Setup
NVIM configurations as of 09/01/22

## Core requirements
- Python 3
- Homebrew

## Python packages
- `pip3 install pynvim`

## Brew packages
- `brew install --HEAD neovim luajit`
- `brew install ripgrep iterm2`

## Nvim commands
Once all the files are in place, open up any file with `nvim` and run the following:
- `:PackerSync`
- `:Mason`

### ARM64 Mac Users
When running Treesitter update/install for language servers. If you are on an
arm64 MAC you may get some errors about the architecture being incorrect. In
that case, you need to uninstall all the `*.so` files and re-open nvim on Macs
native terminal. This will install/re-compile the correct language servers.

Current path to the `*.so` files:
- `~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser`

## Optional iTerm configurations
- Install a [Nerd Font](https://www.nerdfonts.com/) to configure in iTerm. This will give better icon support in the various plugins.
- Change Profiles > Text > Font-size to something easy to read
- Change Profiles > Text > Font to the Nerd Font downloaded earlier
- Turn off General > Closing > Confirm Quit iTerm2
- Set Profiles > General > WorkingDirectory > Reuse previous sessions working directory

# Neovim Setup

## Requirements
- [Homebrew](https://brew.sh)

## Brew packages
- `brew install neovim`
- `brew install ripgrep`
- `brew install node` (LSP requirements)

## Language Support
Some of the LSP servers will not install correctly without installing the
language first. This list may not be completely accurate. You may not need all
of these or you may need more.

- [Rust](https://www.rust-lang.org/tools/install)
- [Go](https://go.dev/doc/install)
- [Node](https://nodejs.org/en/download/package-manager) or [Bun](https://bun.sh/docs/installation)

## Link configuration files
- `ln -s "$(pwd)/nvim" ~/.config/nvim`

### ARM64 Mac Users using Rosetta 2
When running Treesitter update/install for language servers. If you are on an
arm64 MAC you may get some errors about the architecture being incorrect. In
that case, you need to uninstall all the `*.so` files and re-open nvim on Macs
native terminal. This will install/re-compile the correct language servers.

Current path to the `*.so` files:
- `~/.local/share/nvim/lazy/nvim-treesitter/parser/`

The next issue you are likely to encounter is that the `telescope-fzf-native`
package cannot build in an emulator using rosetta. So you need to build it in
your native terminal app.

1. `cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim`
1. `make clean`
1. `make`
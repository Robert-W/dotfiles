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

## Plugin Configuration Convention
Plugins are defined and configired in `/plugin`. That directory is sourced in
alphabetical order so I generally follow a fairly simple naming convention.

```
# Files you want to run first start with low numbers
01-colorscheme.lua

# Files that are dependencies for multiple plugins start with 40
# These files should start with a comment mentioning which plugins depend on them
40-plenary.lua

# Files that we want to lazy load start with 42 and run in autocmd's
42-which-key.lua

# All other plugin configurations that don't need to run first, or lazy load
# are named by their use
lsp.lua
```

## Known Issues
Currently when you start from a fresh install, you'll get some errors and it
requires you to restart to complete the setup. The reason is that the treesitter
parsers will fail to install without the tree-sitter-cli. The tree-sitter-cli is
installed via mason but treesitter does not wait for that to be complete. If you
restart neovim after mason finishes installing, treesitter will install all the
parsers correctly and the setup is complete. Ill push a fix when I find one.

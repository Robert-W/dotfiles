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

### Plugin Configuration Convention
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

### Known Issues
Currently when you start from a fresh install, you'll get some errors and it
requires you to restart twice to do the initial setup. This is because we use
the mason regisrty to pull the tree-sitter-cli which is needed in the latest
treesitter. The registry is not populated initially, but is after the first
restart. Treesitter cannot install the parsers until the cli is installed. So
you need to restart a second time and then everything is installed correctly.

Adding a call to `registry.refresh()` in `/lua/utils/mason-packager.lua` fixes
the initial issue with installing the tree-sitter-cli. However, it overrides
some settings resulting in you needing to confirm every message. Once I fix
this, I'll make some changes to make the initial setup cleaner.

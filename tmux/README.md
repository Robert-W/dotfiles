# Tmux Setup

## Requirements
- [Homebrew](https://brew.sh)

## Brew packages
- `brew install tmux`
- `brew install fzf`

## Link configuration files
- `ln -s "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf`
- `ln -s "$(pwd)/tmux/scripts" ~/.local/bin`

> May need to delete the `.tmux.conf` file if one already exists.

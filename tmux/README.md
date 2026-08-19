# Tmux Setup

## Link configuration files
- `ln -s "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf`
- `ln -s "$(pwd)/tmux/scripts/tmux-sessionizer" ~/.local/bin`

## Dependencies
This requires tmux obviously and fxf. The commands for these are in the install
scripts.

> May need to delete the `.tmux.conf` file if one already exists.
> May need to create the `~/.local/bin` directory if it does not exist.

# ZSH Setup

## Link configuration files
- `ln -s "$(pwd)/zsh/.zfunc" ~/.zfunc`
- `ln -s "$(pwd)/zsh/.zshrc" ~/.zshrc`
- `ln -s "$(pwd)/zsh/.zprofile" ~/.zprofile`

## Dependencies
In order to use the aws related functions in `.zfunc`, you need to install the
aws cli and jq. The commands for these are in the install scripts.

> May need to delete the `.zshrc` file if one already exists.

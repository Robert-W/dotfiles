# ZSH Setup

## Requirements
- [Homebrew](https://brew.sh)

## Brew packages
- `brew install iterm2`

## Link configuration files
- `ln -s "$(pwd)/zsh/.zfunc" ~/.zfunc`
- `ln -s "$(pwd)/zsh/.zshrc" ~/.zshrc`
- `ln -s "$(pwd)/zsh/.zprofile" ~/.zprofile`

## Additional Dependencies
In order to use the aws related functions in `.zfunc`, you need to install the
aws cli and jq via brew.

- `brew install jq awscli`

> May need to delete the `.zshrc` file if one already exists.

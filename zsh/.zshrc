# Autoload Colors, VCS Info, and Completion functions
autoload -Uz colors vcs_info compinit

# Initialize completions
compinit

# Run these autoloads before a prompt is displayed
precmd() {
  vcs_info
  colors
}

# Load starship
eval "$(starship init zsh)"

# Load functions from external directory
fpath=(~/.zfunc $fpath)
autoload ${fpath[1]}/*(:t)

# Add any scripts/programs to path here and then export it
# Handle OS specific paths first
if [[ "$OSTYPE" == linux-* ]]; then
  path+=('/opt/nvim-linux-x86_64/bin')
fi

path+=("$HOME/.local/bin")
export PATH

# Setup nvm completion and home dir
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

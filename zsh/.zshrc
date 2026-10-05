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

# Override ZSH defaults
# This overrides the auto-removable suffix characters during tab completion. The
# following is default, ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&|'. Which means after
# tab completion, if you press those characters, it consumes the space and
# places that char. This is fine for $' \t\n;', pipe is annoying because if I
# tab complete a filepath then use pipe, the space is consumed. Adding &| to
# ZLE_SPACE_SUFFIX_CHARS allows zsh to consume the space, but then adds it back.
# Other completion functions can override this, so this may need to be tweaked.
ZLE_SPACE_SUFFIX_CHARS=$'&|'

# Add any scripts/programs to path here and then export it
if [[ -d /opt/nvim/bin ]] && ! [[ $PATH =~ "/opt/nvim/bin" ]]; then
  path+=('/opt/nvim/bin')
fi

# Add golang
if [[ -d /usr/local/go/bin ]] && ! [[ $PATH =~ "/usr/local/go/bin" ]]; then
  path+=('/usr/local/go/bin')
  path+=("${GOPATH:-$HOME/go}/bin")
fi

if ! [[ $PATH =~ "$HOME/.local/bin" ]]; then
  path+=("$HOME/.local/bin")
fi

export PATH

# Setup and bindkey or aliases
bindkey -s ^f "tmux-sessionizer\n"

# Setup nvm completion and home dir
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

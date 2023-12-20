# Load colors & VCS Info & completion
autoload -Uz colors vcs_info compinit

# Run our autoloads
precmd() {
  vcs_info
  compinit
  colors
}

# Implement custom git status hook, this will be the %m in formats above
+vi-git-status() {
local str='';

  # Are we in a Git repository
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") '==' '0' ]; then
    # Are we not in the .git folder
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" '==' 'false' ]; then
      # Ensure index is up to date
      git update-index --really-refresh -q &>/dev/null;

      # Flag to add better padding if str is modified
      is_modified=0;

      # Check for various statuses

      # Uncommitted changes
      if ! $(git diff --quiet --ignore-submodules --cached); then
        str+='+';
        is_modified=1;
      fi;

      # Unstaged changes
      if ! $(git diff-files --quiet --ignore-submodules --); then
        str+='!';
        is_modified=1;
      fi;

      # Untracked files
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        str+='?';
        is_modified=1;
      fi;

      # Stashed files
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        str+='$';
        is_modified=1;
      fi;

      if [ $is_modified -eq 1 ]; then
        str="%F{229}[${str}]%f";
      else
        str=$'\UF6C8'
      fi;

    fi;
  fi;

  # Set a value for str if none has been set yet, its just a hypen for now
  hook_com[misc]=" ${str}";
}

# Finalize Prompt
setopt PROMPT_SUBST

# Customize VCS Info Message Variable
zstyle ':vcs_info:git*+set-message:*' hooks git-status
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr '%F{219}$%f'
# Enabling the two commands above allows for %c to be set for the formats
# and shows stagedstr when there are committed changes
zstyle ':vcs_info:git:*' formats ' on %F{219}%b%f%m'

# Customize our prompt over multiple lines
# Fun font icons for prompt, these need Operator Mono Nerd Font
# ﯜ = U+FBDC
#  = U+F43B
#  = U+E245
#  = U+F7A9
#  = U+F6E4
#  = U+F42E
#  = U+F6C8
# ➜ = U+279C
NEWLINE=$'\n'
PROMPT=$'%F{123}${PWD/#$HOME/~}%b%f${vcs_info_msg_0_}${NEWLINE}%B%F{85}\UF6E4  %f%b';

# Load functions from external directory
fpath=(~/.zfunc $fpath)
autoload ${fpath[1]}/*(:t)

# Load any additional scripts to path
export PATH="$HOME/.local/bin:$PATH"

# Fix Docker builds on Apple Silicon so they deploy correctly to AWS
export DOCKER_DEFAULT_PLATFORM=linux/amd64

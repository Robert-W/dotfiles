# Git Completion
if [ ! -f ~/.zsh/_git ]; then
  echo "Downloading git auto-complete"
  mkdir -p ~/.zsh
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.zsh/git-completion.bash
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o ~/.zsh/_git
fi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# Load colors & VCS Info
autoload -Uz colors vcs_info compinit

# Run our autoloads
precmd() {
  vcs_info
  compinit
  colors
}

# Customize VCS Info Message Variable
zstyle ':vcs_info:git*+set-message:*' hooks git-status
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{177}$%f'
zstyle ':vcs_info:git:*' formats '[%F{177}%b%f] %c%m'

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
        str+=' ';
      fi;

    fi;
  fi;

  # Set a value for str if none has been set yet, its just a hypen for now
  hook_com[misc]="%F{yellow}${str}%f";
}

# Finalize Prompt
setopt PROMPT_SUBST

# Format = working_dir [git_branch] git_status %
# PROMPT='%{$fg_bold[white]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg_bold[green]%}${vcs_info_msg_0_}%{$reset_color%} %% ';
PROMPT='%B${PWD/#$HOME/~} %F{77DD77}(╯°□°)╯︵ ┻━┻%f%b ${vcs_info_msg_0_}> ';

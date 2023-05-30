# Git Completion
if [ ! -f ~/.zsh/git-completion.zsh ]; then
  echo "Downloading git auto-complete for zsh"
  mkdir -p ~/.zsh
  curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  curl -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
fi

# Tell the shell how to give us inline hints
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

# Add functions from zsh completion
fpath=(~/.zsh $fpath)

# Load colors & VCS Info
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
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{219}$%f'
zstyle ':vcs_info:git:*' formats ' on %F{219}%b%f%c%m'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Helpful Functions, requires JQ and awscli, brew install jq awscli
aws-login() {
  if [ -z "${1}" ]; then
    echo "Usage: aws-login AWS_PROFILE" 1>&2
    return
  fi

  if ! command -V jq > /dev/null; then
    echo "The jq command is required for this function to work."
    return
  fi

  SSO_START_URL=$(aws configure get "profile.${1}.sso_start_url")

  if [ -z "${SSO_START_URL}" ]; then
    echo "profile (${1}) not configured for sso; Missing sso_start_url" 1>&2
    return
  fi

  ACCESS_TOKEN=$(cat ~/.aws/sso/cache/*.json | jq -r --arg url "${SSO_START_URL}" 'select(.startUrl==$url).accessToken')
  SSO_ACCOUNT_ID=$(aws configure get "profile.${1}.sso_account_id")
  SSO_ROLE_NAME=$(aws configure get "profile.${1}.sso_role_name")
  CREDS=$(aws sso get-role-credentials --account-id "${SSO_ACCOUNT_ID}" --role-name "${SSO_ROLE_NAME}" --access-token "${ACCESS_TOKEN}" --profile "${1}" 2>/dev/null)

  if [ "$?" != "0" ]; then
    aws sso login --profile "${1}" &>/dev/null
    ACCESS_TOKEN=$(cat ~/.aws/sso/cache/*.json | jq -r --arg url "${SSO_START_URL}" 'select(.startUrl==$url).accessToken')
    CREDS=$(aws sso get-role-credentials --account-id "${SSO_ACCOUNT_ID}" --role-name "${SSO_ROLE_NAME}" --access-token "${ACCESS_TOKEN}" --profile "${1}")
  fi

  export AWS_ACCESS_KEY_ID=$(jq -r '.roleCredentials.accessKeyId' <<< "${CREDS}")
  export AWS_SECRET_ACCESS_KEY=$(jq -r '.roleCredentials.secretAccessKey' <<< "${CREDS}")
  export AWS_SESSION_TOKEN=$(jq -r '.roleCredentials.sessionToken' <<< "${CREDS}")
  export AWS_PROFILE="${1}"
}

aws-logout() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
  unset AWS_PROFILE
  aws sso logout
}

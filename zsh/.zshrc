# Load colors & VCS Info
autoload -Uz colors vcs_info

# Run our autoloads
precmd() {
	vcs_info
	colors
}

# Customize VCS Info Message Variable
zstyle ':vcs_info:git*+set-message:*' hooks git-status
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{cyan}$%f'
zstyle ':vcs_info:git:*' formats '[%F{cyan}%b%f] %c%m'

# Implement custom git status hook, this will be the %m in formats above
+vi-git-status() {
  local str='';

	# Are we in a Git repository
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") '==' '0' ]; then
		# Are we not in the .git folder
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" '==' 'false' ]; then
			# Ensure index is up to date
			git update-index --really-refresh -q &>/dev/null;

			# Check for various statuses

			# Uncommitted changes
			if ! $(git diff --quiet --ignore-submodules --cached); then
				str+='+';
			fi;

			# Unstaged changes
			if ! $(git diff-files --quiet --ignore-submodules --); then
				str+='!';
			fi;

			# Untracked files
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				str+='?';
			fi;

			# Stashed files
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				str+='$';
			fi;

		fi;
  fi;

  # Set a value for str if none has been set yet, its just a hypen for now
	hook_com[misc]="%F{yellow}${str:--}%f";
}

# Finalize Prompt
setopt PROMPT_SUBST

# Format = working_dir [git_branch] git_status %
PROMPT='%{$fg_bold[white]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg_bold[green]%}${vcs_info_msg_0_}%{$reset_color%} %% ';

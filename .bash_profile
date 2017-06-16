if [ ! -f ~/.git-completion.bash ]; then
	echo "Downloading git auto-complete"
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

###########################
# Some useful git functions
###########################

## 
# Create a new branch
##

gbranch () {
	if [ -z "$1" ]; then
		git branch
		return
	fi

	git fetch
	git checkout -b $1
	git push -u origin $1
}

##
# Prune remote origin of stale branches
##

gprune () {
	git remote prune origin
}

#############################
# Some useful docker commands
#############################

##
# Remove Dangling Images
##
cleanDockerImages () {
	docker rmi $(docker images -qf "dangling=true")
}

##
# Remove Dangling Volumes
##
cleanDockerVolumes () {
	docker volume rm $(docker volume ls -qf "dangling=true")
}

##
# Remove All Containers
##
removeDockerContainers () {
	docker rm $(docker ps -aq)
}

##
# Interactively remove images
##
removeDockerInteractive () {
	echo Write a program that lists all containers in a select and lets the user pick and choose which ones he wants to remove
}

##############
# Autocomplete
##############

sshAutoComplete () {
	local cur pref opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	opts=$(grep '^host' ~/.ssh/config | cut -d " " -f 2)
	COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
	return 0
}

complete -F sshAutoComplete ssh

#########
# Aliases
#########

alias l="ls -al"

##############
# Path Updates
##############

export PATH="$HOME/.fastlane/bin:$PATH"



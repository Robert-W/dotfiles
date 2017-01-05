if [ ! -f ~/.git-completion.bash ]; then
				echo "Downloading git auto-complete"
				curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

# Some useful aliases

alias l="ls -al"
alias lf="ls -CF"

# Some useful git functions

## 
# Create a new branch
##

gbranch () {
	if [ -z "$1" ]; then
		echo "You must provide a branch name"
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

# Some useful docker commands

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

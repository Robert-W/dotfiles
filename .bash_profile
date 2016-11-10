if [ ! -f ~/.git-completion.bash ]; then
				echo "Downloading git auto-complete"
				curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

# Some useful git functions

## 
# Create a new branch
##

branch () {
	if [ -z "$1" ]; then
		exit
	fi

	git fetch
	git checkout -b $1
	git push -u origin $1
}

##
# Prune remote origin of stale branches
##

prune () {
	git remote prune origin
}

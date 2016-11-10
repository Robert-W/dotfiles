if [ ! -f ~/.git-completion.bash ]; then
				echo "Downloading git auto-complete"
				curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi
. ~/.git-completion.bash

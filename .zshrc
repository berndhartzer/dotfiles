# Prompt
export PS1="%n[%j] %B%~%b $ "

# Don't put duplicate lines or lines starting with whitespace in history
HISTCONTROL=ignoreboth
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Dotfiles repo config alias
# alias config='/usr/bin/git --git-dir=/Users/berndhartzer/.cfg/ --work-tree=/Users/berndhartzer'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ll='ls -alG'
alias dc='docker-compose'
alias tf='terraform'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
eval "$(direnv hook zsh)"

# Open GitHub URL in browser by specifying the author/repo, e.g.
# $ gh berndhartzer/dotfiles
# Alternatively, we can open the repo (and branch) at our current working directory like so:
# $ gh .
# Or, open a specific commit in a repo
# $ gh . <commit SHA>
function gh() {
	REPO=${1}
	COMMIT=${2}
	URL_PATH=""

	if [ "${REPO}" = "." ]; then
		git status > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			REPO=$(git config --get remote.origin.url | awk -F'[:.]' '{print $3;}')
			BRANCH=$(git rev-parse --abbrev-ref HEAD)
			REPO="${REPO}"
			URL_PATH="/tree/${BRANCH}"
		else
			REPO=""
		fi
	fi

	if [ "${COMMIT}" != "" ]; then
	    URL_PATH="/commit/${COMMIT}"
	fi

	if [ "${REPO}" != "" ]; then
		open https://github.com/${REPO}${URL_PATH}
	else
		echo "failed: not in git repo"
	fi
}

# Machine specific config
source ~/.env

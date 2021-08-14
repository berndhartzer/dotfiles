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

# Listing files
alias ll='ls -alG'

# Docker
alias dc='docker-compose'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
eval "$(direnv hook zsh)"

# Open GitHub URL in browser by specifying the author/repo, e.g.
# $ gh berndhartzer/dotfiles
# Alternatively, we can open the repo (and branch) at our current working directory like so:
# $ gh .
gh() {
	REPO=${1}

	if [ "${REPO}" = "." ]; then
		git status > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			REPO=$(git config --get remote.origin.url | awk -F'[:.]' '{print $3}')
			BRANCH=$(git rev-parse --abbrev-ref HEAD)

			REPO="${REPO}/tree/${BRANCH}"
		else
			REPO=""
		fi
	fi

	if [ "${REPO}" != "" ]; then
		open https://github.com/${REPO}
	else
		echo "failed: not in git repo"
	fi
}

# Machine specific config
source ~/.env

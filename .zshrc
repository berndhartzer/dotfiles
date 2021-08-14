# Prompt
export PS1="%n[%j] %B%~%b $ "

# Don't put duplicate lines or lines starting with whitespace in history
HISTCONTROL=ignoreboth

# Dotfiles repo config alias
# alias config='/usr/bin/git --git-dir=/Users/berndhartzer/.cfg/ --work-tree=/Users/berndhartzer'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Listing files
alias ll='ls -alG'
alias la='ls -A'

alias dc='docker-compose'

alias tf='terraform'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
# [ -f /Users/berndhartzer/.travis/travis.sh ] && source /Users/berndhartzer/.travis/travis.sh

# hub alias
# eval "$(hub alias -s)"

# direnv
eval "$(direnv hook zsh)"

source ~/.env

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/berndhartzer/dev/funcaptcha/node_modules/tabtab/.completions/slss.zsh

gh() {
	REPO=${1}

	if [ "${REPO}" = "." ]; then
		git status > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			REPO=$(git config --get remote.origin.url | awk -F'[:.]' '{print $3;}')
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

function jira() {
	open "https://arkoselabs.atlassian.net/browse/${1}"
}

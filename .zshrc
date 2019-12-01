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
alias la='ls -A'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/berndhartzer/.travis/travis.sh ] && source /Users/berndhartzer/.travis/travis.sh

# direnv
eval "$(direnv hook zsh)"

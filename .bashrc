# Prompt
export PS1="\u@\h[\j] \[$(tput bold)\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"

# Don't put duplicate lines or lines starting with whitespace in history
HISTCONTROL=ignoreboth

# Aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

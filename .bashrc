# Prompt
export PS1="\u@\h[\j] \[$(tput bold)\]\w\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"

# Don't put duplicate lines or lines starting with whitespace in history
HISTCONTROL=ignoreboth

# Aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Start MAMP's apache
start-apache() {
    echo "Starting apache with: sudo /Applications/MAMP/Library/bin/apachectl start ..."
    sudo /Applications/MAMP/Library/bin/apachectl start
}

# Find files by name and open each of them in a vim vertical split
vim-find-multi() {
    find . -name "${1}.*" -exec vim -O {} +
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [ -f /Users/berndhartzer/dev/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/berndhartzer/dev/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [ -f /Users/berndhartzer/dev/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/berndhartzer/dev/serverless/node_modules/tabtab/.completions/sls.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook bash)"

# fun-settings
export MY_PUBLIC_KEY=

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/berndhartzer/dev/funcaptcha/src/web/game3-nojs/node_modules/tabtab/.completions/slss.bash ] && . /Users/berndhartzer/dev/funcaptcha/src/web/game3-nojs/node_modules/tabtab/.completions/slss.bash

# hub alias
eval "$(hub alias -s)"

if [ -s ~/.profile ]; then source ~/.profile; fi
if [ -s ~/.bashrc  ]; then source ~/.bashrc; fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

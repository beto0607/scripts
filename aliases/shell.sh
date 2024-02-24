#!/bin/zsh

# VS-CODE
alias code.="code ."

# NPM/NODE
alias kill_npm="kill \$(ps aux | grep 'node' | awk '{print $1}')"

# Shell 
alias :q="exit"
alias :qa="exit"

# NVIM
alias nvim_config="cd ~/.config/nvim/; nvim ."

# TMUX
alias tmux_config="cd ~/.config/tmux/; nvim ."

# GIT
alias git_config="cd ~/.config/git/; nvim ."

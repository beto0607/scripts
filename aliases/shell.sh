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
alias git_compare="source ~/Personal/scripts/scripts/git/open_compare"

# xClip
alias "xC=xclip"
alias "xc=xclip -selection clipboard"
alias "xv=xclip -o"

# Flush DNS

alias flush_dns="sudo resolvectl flush-caches"

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
alias nvim="~/App/Nvim/nvim.appimage"

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

# hosts
alias edit_hosts="sudo vi /etc/hosts"

# PNPM
alias pnpx="pnpm exec"

# Flameshot
alias flameshot="~/App/Flameshot/Flameshot-12.1.0.x86_64.AppImage"
alias flameshot_gui="flameshot gui"

#!/bin/zsh

REPO_PATH=$(pwd)

# NVIM
nvim_config="$REPO_PATH/nvim"
nvim_config_path="$HOME/.config/nvim"
if [ ! -L ${nvim_config_path} ]; then
    echo "NVIM config doesn't exist"
    ln -s ${nvim_config} ${nvim_config_path}
fi

# TMUX
tmux_config="$REPO_PATH/tmux"
tmux_config_path="$HOME/.config/tmux"
if [ ! -L ${tmux_config_path} ]; then
    echo "TMUX config doesn't exist"
    ln -s ${tmux_config} ${tmux_config_path}
fi

# GIT
git_config="$REPO_PATH/git"
git_config_path="$HOME/.config/git"
if [ ! -L ${git_config_path} ]; then
    echo "GIT config doesn't exist"
    ln -s ${git_config} ${git_config_path}
fi

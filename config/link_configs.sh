#!/bin/zsh


REPO_PATH="/home/beto0607/Personal/scripts/config"


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

# ZSH
zsh_config="$REPO_PATH/zsh/zshrc"
zsh_config_path="$HOME/.zshrc"
if [ ! -L ${zsh_config_path} ]; then
    echo "ZSH config doesn't exist"
    ln -s ${zsh_config} ${zsh_config_path}
fi

# Gitmux
gitmux_config="$REPO_PATH/gitmux/gitmux.conf"
gitmux_config_path="$HOME/.gitmux.conf"
if [ ! -L ${gitmux_config_path} ]; then
    echo "Gitmux config doesn't exist"
    ln -s ${gitmux_config} ${gitmux_config_path}
fi

# # Kitty
# kitty_config="$REPO_PATH/kitty"
# kitty_config_path="$HOME/.config/kitty"
# if [ ! -L ${kitty_config_path} ]; then
#     echo "Kitty config doesn't exist"
#     ln -s ${kitty_config} ${kitty_config_path}
# fi

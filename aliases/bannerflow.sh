#!/bin/zsh

BANNERFLOW_PATH="$HOME/Bannerflow"
export STUDIO_PATH="$BANNERFLOW_PATH/Studio"
export REMOTE_INFRA_PATH="$BANNERFLOW_PATH/remote-compose-infra"
export COMPOSE_INFRA_PATH="$BANNERFLOW_PATH/ComposeInfra"

# STUDIO
# -- app 
alias kill_studio="sudo fuser -k 3000/tcp"
alias studio_dev="pnpx nx run studio:serve:remote"

# Remote infra
alias gateway_up="cd $REMOTE_INFRA_PATH; docker compose up -d linux"
alias gateway_up_mac="cd $REMOTE_INFRA_PATH; docker compose up -d mac"
alias gateway_down="cd $REMOTE_INFRA_PATH; docker compose down linux"
alias gateway_down_mac="cd $REMOTE_INFRA_PATH; docker compose down mac"


# Utils
alias code_studio="code $STUDIO_PATH"


# MongoDB
alias mongodb_up="cd $COMPOSE_INFRA_PATH; docker compose up -d mongodb"

# AzureStorage 
alias storage_up="cd $COMPOSE_INFRA_PATH; docker compose up -d storage-emulator "

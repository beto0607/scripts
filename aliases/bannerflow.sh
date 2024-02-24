#!/bin/zsh

BANNERFLOW_PATH="$HOME/Bannerflow"
export STUDIO_PATH="$BANNERFLOW_PATH/Studio"
export REMOTE_INFRA_PATH="$BANNERFLOW_PATH/remote-compose-infra"

# STUDIO
# -- app 
alias studio_start_dev="cd $STUDIO_PATH; npx nx run studio:serve:remote"
alias studio_build_scripts="cd $STUDIO_PATH; npm run build:scripts -- --watch"
# -- acg
alias acg_start_dev="cd $STUDIO_PATH; npx nx run acg:serve:development"
# -- test
alias npm_test_ng="cd $STUDIO_PATH; npm run test:ng -- --watch --silent=false"

# Remote infra
alias gateway_up="cd $REMOTE_INFRA_PATH; docker compose -f docker-compose-linux.yml up -d"
alias gateway_up_mac="cd $REMOTE_INFRA_PATH; docker compose -f docker-compose-mac.yml up -d"
alias gateway_down="cd $REMOTE_INFRA_PATH; docker compose -f docker-compose-linux.yml down"
alias gateway_down_mac="cd $REMOTE_INFRA_PATH; docker compose -f docker-compose-mac.yml down"


# Utils
alias code_studio="code $STUDIO_PATH"

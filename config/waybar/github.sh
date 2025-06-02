#!/bin/bash

token=$(gh auth token)
# token=$(cat ${HOME}/.config/github/notifications.token)
count=$(curl -u username:${token} https://api.github.com/notifications | jq '. | length')

echo '{"text":'$count',"tooltip":"$tooltip","class":"$class"}'

#!/bin/bash

set -eu

# shellcheck disable=SC2046
cd $(dirname "$0") || exit

ANSIBLE_PATH=~/workspace/settings/mac-ansible

## command line tools
xcode-select --install

## install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## install ansible
brew install ansible

## clone repo
git clone https://github.com/yoshiyoshifujii/mac-ansible.git ${ANSIBLE_PATH}

## ansible
cd ${ANSIBLE_PATH}
ansible-playbook -i inventory/localhost localhost.yml --extra-vars 'github_access_token=${GITHUB_ACCESS_TOKEN} base_name=${BASE_NAME} git_user_name="${GIT_USER_NAME}" git_user_email=${GIT_USER_EMAIL}'

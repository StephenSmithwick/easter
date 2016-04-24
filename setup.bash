#! /bin/bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Docker Version Manager
source /Users/stephensmithwick/.dvm/dvm.sh

# Ruby Version Manager
eval "$(rbenv init -)"

# Node Version Manager
export NVM_DIR="/Users/stephensmithwick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# AWS Tool bash completion
complete -C aws_completer aws

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load Locations
source $DIR/location*

# Helper function
function easter() {
  echo "Easter is installed"
}

export -f easter
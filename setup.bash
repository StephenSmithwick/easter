#! /bin/bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Docker Version Manager
source /Users/stephensmithwick/.dvm/dvm.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load Locations
source $DIR/location*
#! /bin/bash

export JAVA_HOME=$(/usr/libexec/java_home)
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
export EASTER_HOME=$HOME/easter

source "$EASTER_HOME/utilities.bash"

# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
source "$EASTER_HOME/rc.d/git-completion.bash"

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
for location in `ls -d $EASTER_HOME/locations/*/`; do
  if [ -f "${location}rc.bash" ]; then
    source "${location}rc.bash"
  fi
done

# Helper function
function easter() {
  bash "$EASTER_HOME/fetch.bash" $@
}

export -f easter

# One of @janmoesen‚Äôs ProTip‚Ñ¢s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -e -m '$method'"; done

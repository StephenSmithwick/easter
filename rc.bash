#! /bin/bash

export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
export EASTER_HOME=$HOME/easter
export PATH=$PATH:$EASTER_HOME/bin

for rc_file in $EASTER_HOME/rc.d/*; do
  echo "Loading $rc_file"
  source "$rc_file"
done

# Node Version Manager
export NVM_DIR="/Users/stephensmithwick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# One of @janmoesen‚Äôs ProTip‚Ñ¢s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -e -m '$method'"; done

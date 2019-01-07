#! /bin/bash


export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000
export EASTER_HOME=$HOME/easter
export PATH=$PATH:$EASTER_HOME/bin

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

# One of @janmoesen‚Äôs ProTip‚Ñ¢s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -e -m '$method'"; done

# Setup java and Android SDK
export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=$(realpath $(brew --prefix gradle))/libexec
export GRADLE_USER_HOME=$GRADLE_HOME
export ANDROID_HOME=/Users/stephensmithwick/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$GRADLE_HOME/bin:$MAVEN_HOME/bin:$PATH

# Setup go Environment
export GOPATH=~/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

source "$EASTER_HOME/locations.bash"

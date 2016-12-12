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
  if [[ "${@}" =~ "--skip-updates" ]]; then
    export EASTER_UPDATE=false
  fi

  if [[ "${@}" =~ "--help" ]]; then
    echo "easter [--help] [--skip-updates]"
    echo "   --skip-updates  do not do any updates"
    echo "   --help          show this message"
  else
    bash "$EASTER_HOME/fetch.bash"
  fi
  unset EASTER_UPDATE
}

export -f easter

# One of @janmoesen‚Äôs ProTip‚Ñ¢s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -e -m '$method'"; done

# Setup Android SDK
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH

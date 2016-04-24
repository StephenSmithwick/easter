#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Installing Easter Project:"
#####################################################################################################
function add_easter_to_profile {
  echo 'source $HOME/easter/setup.bash' >> $HOME/.bash_profile
}
dep "Profile setup" bin=easter install=add_easter_to_profile
#####################################################################################################
function install_brew {
  /usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"
  brew tap caskroom/cask
}
dep "HomeBrew" bin=brew install=install_brew
#####################################################################################################
log "will update brew"
brew update
#####################################################################################################
function install_bash_completion {
  brew install bash-completion
}
dep "HomeBrew Bash Completion" file=`brew --prefix`/etc/bash_completion install=install_bash_completion
#####################################################################################################
function install_git {
  brew install git
}
dep "git" bin=git install=install_git
#####################################################################################################
function install_java {
  brew install Caskroom/cask/java
}
dep "Java" bin=java install=install_java
#####################################################################################################
function install_dvm {
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
}
dep "Docker Version Manager" file=~/.dvm/dvm.sh install=install_dvm
#####################################################################################################
function install_aws {
  brew install awscli
}
dep "AWS CLI" bin=aws install=install_aws
#####################################################################################################
function install_rbenv {
  brew install rbenv
  brew install rbenv-gemset
}
dep "Ruby Build Environment" bin=rbenv install=install_rvm
#####################################################################################################
function install_lastpass {
  brew install lastpass-cli --with-pinentry --with-doc
}
dep "LastPass CLI" bin=lpass install=install_lastpass
#####################################################################################################
function install_nvm {
  git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags
  . ~/.nvm/nvm.sh
}
dep "Node Version Manager" bin=nvm install=install_nvm
#####################################################################################################
source $HOME/easter/setup.bash
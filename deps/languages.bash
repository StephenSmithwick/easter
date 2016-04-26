#! /bin/bash

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
function install_rbenv {
  brew install rbenv
  brew install rbenv-gemset
}
dep "Ruby Build Environment" bin=rbenv install=install_rvm

#####################################################################################################
function install_nvm {
  git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`
  . ~/.nvm/nvm.sh
}
dep "Node Version Manager" dir="$HOME/.nvm" install=install_nvm

#####################################################################################################
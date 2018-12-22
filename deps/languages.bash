#! /bin/bash

brew_dep "Yarn" brew=yarn

#####################################################################################################


#####################################################################################################
function install_haskell {
  brew install haskell-stack
  stack setup
}
dep "Haskell" bin=stacks install=install_haskell

#####################################################################################################
function install_dvm {
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
}
dep "Docker Version Manager" file=~/.dvm/dvm.sh install=install_dvm

#####################################################################################################
function install_nvm {
  git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`
  . ~/.nvm/nvm.sh
}
dep "Node Version Manager" dir="$HOME/.nvm" install=install_nvm

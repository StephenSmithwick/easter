#! /bin/bash

brew_dep "Java" brew=java cask
brew_dep "Java REPL" brew=javarepl
brew_dep "Yarn" brew=yarn

#####################################################################################################
function install_golang {
  echo "Please enter your github username for go (ex: stephensmithwick):"
  read user

  brew install golang
  export GOPATH=~/golang
  export GOROOT=/usr/local/opt/go/libexec
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin

  #setup golang path and user
  mkdir -p ~/golang/src/github.com/$user

  go get golang.org/x/tools/cmd/godoc
}
dep "Go" bin=go install=install_golang

#####################################################################################################
function install_haskell {
  brew install haskell-stack
  stack setup
}
dep "Haskell" bin=stacks install=install_haskell

#####################################################################################################
function install_maven {
  brew install maven
  brew install maven-completion
}
dep "Maven" bin=mvn install=install_maven

#####################################################################################################
function install_dvm {
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
}
dep "Docker Version Manager" file=~/.dvm/dvm.sh install=install_dvm

#####################################################################################################
function install_rbenv {
  brew install rbenv
  brew install rbenv-gemset
  brew install ruby-completion
  brew install rake-completion
}
dep "Ruby Build Environment" bin=rbenv install=install_rbenv

#####################################################################################################
function install_nvm {
  git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`
  . ~/.nvm/nvm.sh
}
dep "Node Version Manager" dir="$HOME/.nvm" install=install_nvm

#####################################################################################################
function install_reason {
  npm install -g git://github.com/reasonml/reason-cli.git
}
dep "Reason" bin=ocamlmerlin-reason install=install_reason

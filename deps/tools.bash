#! /bin/bash

#####################################################################################################
function install_bash_completion {
  brew install bash-completion
}
dep "HomeBrew Bash Completion" file=`brew --prefix`/etc/bash_completion install=install_bash_completion

#####################################################################################################
function install_aws {
  brew install awscli
}
dep "AWS CLI" bin=aws install=install_aws

#####################################################################################################
function install_lastpass {
  brew install lastpass-cli --with-pinentry --with-doc
}
dep "LastPass CLI" bin=lpass install=install_lastpass
#####################################################################################################
function install_emacs {
  brew install emacs --with-cocoa --srgb
  brew linkapps emacs
}
dep "Emacs" dir="/usr/local/Cellar/emacs" install=install_emacs
#####################################################################################################
function install_atom {
  brew install Caskroom/cask/atom
}
dep "Atom" dir="/Applications/Atom.app" install=install_atom
#####################################################################################################

#! /bin/bash

#####################################################################################################
function add_easter_to_profile {
  echo 'source $HOME/easter/rc.bash' >> $HOME/.bash_profile
}
dep "Profile setup" bin=easter install=add_easter_to_profile

#####################################################################################################
function install_brew {
  /usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"
  brew tap caskroom/cask
}
dep "HomeBrew" bin=brew install=install_brew

#####################################################################################################
function install_git {
  brew install git
  rm -r $EASTER_HOME
  git clone https://gist.github.com/$GIST.git $EASTER_HOME
}
dep "Git" bin=git install=install_git

#####################################################################################################
log "will update brew"
brew update

#####################################################################################################
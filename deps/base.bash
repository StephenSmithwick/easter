#! /bin/bash

#####################################################################################################
function add_easter_to_profile {
  echo 'source $HOME/easter/rc.bash' >> $HOME/.bash_profile
}
dep "Profile setup" bin=easter install=add_easter_to_profile

#####################################################################################################
function install_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
}
dep "HomeBrew" bin=brew install=install_brew

#####################################################################################################
function install_git {
  brew install git
  rm -r $EASTER_HOME
  git clone https://github.com/StephenSmithwick/easter.git $EASTER_HOME
}
dep "git" bin=git install=install_git

#####################################################################################################
function update_brew {
  if [ "${EASTER_UPDATE}" != false ]; then
    log "will update brew"
    brew update
    brew upgrade `brew outdated`
  fi
}
update_brew $@

#####################################################################################################

#! /bin/bash

#####################################################################################################
function add_easter_to_profile {
  echo 'source $HOME/easter/rc.bash' >> $HOME/.bash_profile
}
dep "Profile setup" bin=easter install=add_easter_to_profile

#####################################################################################################
function install_xcode {
  sudo xcodebuild -license
}
dep "XCode" bin=gcc install=install_xcode

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
function update_brew() {
  local update_brew
  local "${@}"

  if [ "${update_brew}" != false ]; then
    log "will update brew"
    brew update
  fi
}
update_brew $@

#####################################################################################################
function setup_rcd {
  mkdir $EASTER_HOME/rc.d
}
dep "rc.d" dir=$EASTER_HOME/rc.d install=setup_rcd

#####################################################################################################
function install_bash_completion {
  brew install bash-completion
  brew tap homebrew/completions
  brew install brew-cask-completion

  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o $EASTER_HOME/rc.d/git-completion.bash
}
dep "Bash Completion" brew=bash-completion install=install_bash_completion

#####################################################################################################

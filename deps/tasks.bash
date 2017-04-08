#! /bin/bash

function install_taskwarrior {
  brew install task
  brew install taskd
  brew install tasksh
}

#####################################################################################################

dep "Taskwarrior" bin=tasksh install=install_taskwarrior
brew_dep "Taskwarrior pomodoro" brew=taskwarrior-pomodoro cask

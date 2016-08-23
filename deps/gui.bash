#! /bin/bash

#####################################################################################################
function install_spectacle {
  brew cask install spectacle
}
dep "Spectacle" brew=spectacle install=install_spectacle

#! /bin/bash

brew_dep "AWS CLI" bin=aws brew=awscli

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
function install_youtubedl {
  brew install ffmpeg rtmpdump youtube-dl
}
dep "Youtube Downloader" bin=youtube-dl install=install_youtubedl

#####################################################################################################
function install_bash_completion {
  brew install bash-completion
  brew tap homebrew/completions
}
dep "Bash Completion" brew=bash-completion install=install_bash_completion

#####################################################################################################

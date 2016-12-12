#! /bin/bash

brew_dep "AWS CLI" brew=awscli
brew_dep "Heroku" brew=heroku
brew_dep "wget" brew=wget
brew_dep "Atom" brew=atom cask
brew_dep "Certbot - LetsEncrypt" brew=certbot

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
function install_youtubedl {
  brew install ffmpeg rtmpdump youtube-dl
}
dep "Youtube Downloader" bin=youtube-dl install=install_youtubedl

#####################################################################################################

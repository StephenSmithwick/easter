#! /bin/bash

brew_dep "AWS CLI" brew=awscli
brew_dep "Heroku" brew=heroku
brew_dep "wget" brew=wget
brew_dep "htop" brew=htop
brew_dep "Atom" brew=atom cask
brew_dep "Intellij" brew=intellij-idea-ce cask
brew_dep "Android Studio" brew=android-studio cask
brew_dep "Certbot - LetsEncrypt" brew=certbot
brew_dep "CMake" brew=cmake
brew_dep "Android File Transfer" brew=android-file-transfer cask
brew_dep "Google Drive" brew=google-drive cask
brew_dep "Man in the Middle Proxy (mitmproxy)" brew=mitmproxy
brew_dep "MiniKube - Kubernetes" brew=minikube cask

#####################################################################################################
function install_vagrant {
  brew cask install vagrant
  brew cask install vagrant-manager
}
dep "Vagrant" bin=vagrant install=install_vagrant

#####################################################################################################
function install_gitql {
  go get -u -d github.com/cloudson/gitql
  cd $GOPATH/src/github.com/cloudson/gitql
  make
  make install
}
dep "Gitql" bin=git-ql install=install_gitql

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

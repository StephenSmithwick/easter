#! /bin/bash

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

#! /bin/bash

#####################################################################################################
function install_haskell {
  brew install haskell-stack
  stack setup
}
dep "Haskell" bin=stacks install=install_haskell

#####################################################################################################

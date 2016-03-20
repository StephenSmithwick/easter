#! /bin/bash

# Add setup to profile 
echo 'source setup.bash' >> .profile

# Install Brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install Git
brew install git 
brew install bash-completion

# Install java
brew install Caskroom/cask/java

# Install Caskroom
brew tap caskroom/cask

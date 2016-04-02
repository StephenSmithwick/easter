#! /bin/bash

# Add setup to profile 
echo 'source easter/setup.bash' >> .profile

# Install Brew
if [ ! -f /usr/local/bin/brew ]; then 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

# Install Git
brew install git 
brew install bash-completion

# Install java
brew install Caskroom/cask/java

# Install Caskroom
brew tap caskroom/cask

# Install Docker Version Manager
if [ ! -f ~/.dvm/dvm.shs ]; then 
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
fi
#! /bin/bash

# Add setup to profile 
echo 'source easter/setup.bash' >> .profile

# Install Brew
if [ ! -f /usr/local/bin/brew ]; then 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  # Install Caskroom
  brew tap caskroom/cask
  brew install bash-completion
fi

# Install Git
if [ ! $(command -v git) ]; then 
  brew install git 
fi

# Install java
if [ ! $(command -v java) ]; then 
  brew install Caskroom/cask/java
fi

# Install Docker Version Manager
if [ ! -f ~/.dvm/dvm.shs ]; then 
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
fi
#! /bin/bash

echo "Installing Easter Project:"

# Add setup to profile 
echo 'source easter/setup.bash' >> .profile


function log {
  echo " - Easter $@"
}

function log_installed {
  log "found $@"
}

function log_installing {
  log "install $@"
}

function dep {
  local name=$1; shift
  local file bin install
  local "${@}"
  if [ ! -z ${file} ] && [ ! -f "${file}" ]; then
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${bin} ] && [ ! $(command -v ${bin}) ]; then
    log "will install: $name"
    eval "${install}"
  else
    log "wont install: $name"
  fi
}

# Install Brew
dep "HomeBrew" file=/usr/local/bin/brews install="
  /usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"
  brew tap caskroom/cask
"
# if [ ! -f /usr/local/bin/brew ]; then 
#   log_installing brew
#   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
#   # Install Caskroom
#   brew tap caskroom/cask
# else 
#   log_installed brew
# fi

log "will update brew"
brew update

# Install  Bash Completion
if [ ! -f `brew --prefix`/etc/bash_completion ]; then
  log_installing "brew bash completion"
  brew install bash-completion
else
  log_installed "brew bash completion"
fi

# Install Git
if [ ! $(command -v git) ]; then
  log_installing git
  echo " - Easter is installing: git"
  brew install git 
else
  log_installed git
fi

# Install java
if [ ! $(command -v java) ]; then 
  log_installing java
  brew install Caskroom/cask/java
else
  log_installed java
fi

# Install Docker Version Manager
if [ ! -f ~/.dvm/dvm.sh ]; then 
  log_installing dvm
  curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh
else
  log_installed dvm
fi
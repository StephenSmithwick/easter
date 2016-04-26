#! /bin/bash

echo "Downloading Easter Project:"

GIST=59cb017eeedc9396cd94

if [ -d $HOME/easter/.git ]; then
  pushd $HOME/easter
  git pull
  popd
else
  git clone https://gist.github.com/$GIST.git 
fi

bash $HOME/easter/install.bash
#! /bin/bash
GIST=59cb017eeedc9396cd94

if [ -d $HOME/easter/.git ]; then
  echo "Updating Easter Project:"
  pushd $HOME/easter
  git pull
  popd
else
  echo "Installing Easter Project:"
  git clone https://gist.github.com/$GIST.git $HOME/easter
fi

bash $HOME/easter/install.bash
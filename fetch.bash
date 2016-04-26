#! /bin/bash

export EASTER_HOME=$HOME/easter

GIST=59cb017eeedc9396cd94 VERSION=HEAD

if [ -d $EASTER_HOME/.git ]; then
  echo "Updating Easter Project:"
  pushd $EASTER_HOME
  git pull
  popd
elif [ ! $(command -v git) ]; then
  echo "Installing Easter Project:"
  wget -qO- https://gist.github.com/StephenSmithwick/$GIST/archive/$VERSION.zip | bsdtar -xvf- 

  mkdir -p $EASTER_HOME
  mv $GIST-$VERSION/* $EASTER_HOME
  rm -r $GIST-$VERSION
else
  echo "Installing Easter Project:"
  git clone https://gist.github.com/$GIST.git $EASTER_HOME
fi

bash $EASTER_HOME/dependencies.bash
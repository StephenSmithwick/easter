#! /bin/bash

export EASTER_HOME=$HOME/easter

REPO=easter BRANCH=master

if [ -d $EASTER_HOME/.git ]; then
  echo "Updating Easter Project:"
  pushd $EASTER_HOME
  git pull
  popd
elif [ ! $(command -v git) ]; then
  echo "Installing Easter Project:"
  wget -qO- https://github.com/StephenSmithwick/${REPO}/archive/${BRANCH}.zip | bsdtar -xvf- 

  mkdir -p $EASTER_HOME
  mv $REPO-$BRANCH/* $EASTER_HOME
  rm -r $REPO-$BRANCH
else
  echo "Installing Easter Project:"
  git clone https://github.com/StephenSmithwick/${REPO}.git $EASTER_HOME
fi

bash $EASTER_HOME/dependencies.bash

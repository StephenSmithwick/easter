#! /bin/bash

export EASTER_HOME=$HOME/easter

function install_easter() {
  repo="${repo-easter}"
  branch="${branch-master}"

  if [ "${EASTER_UPDATE}" != false ]; then
    if [ -d $EASTER_HOME/.git ]; then
      echo "Updating Easter Project:"
      pushd $EASTER_HOME
      git pull
      popd
    elif [ ! $(command -v git) ]; then
      echo "Installing Easter Project:"
      wget -qO- https://github.com/StephenSmithwick/${repo}/archive/${branch}.zip | bsdtar -xvf-

      mkdir -p $EASTER_HOME
      mv $repo-$branch/* $EASTER_HOME
      rm -r $repo-$branch
    else
      echo "Installing Easter Project:"
      git clone https://github.com/StephenSmithwick/${repo}.git $EASTER_HOME
    fi
  fi
}

install_easter
bash $EASTER_HOME/dependencies.bash

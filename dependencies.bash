#! /bin/bash

function install {
  ruby -I $EASTER_HOME/src $EASTER_HOME/src/install.rb $@
}

echo "Checking Easter Dependencies:"
install --yml $EASTER_HOME/baskets/easter_dependencies.yml


for basket in `ls  $EASTER_HOME/baskets/*.yml`; do
  install --yml ${basket} $BREW_OPTIONS
done

. $EASTER_HOME/rc.bash

###### Legacy location logic
echo "🐔 Locations"
. $EASTER_HOME/deps/private.bash

#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
deps base title="Base"
deps languages title="Languages"
deps tools title="Tools"
deps platforms title="Platform Tools"
deps private title="Locations (Private)"

for dependency in `ls  $EASTER_HOME/dependencies/*.yml`; do
  install --yml ${dependency}
done

. $HOME/easter/rc.bash

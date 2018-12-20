#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
# deps base title="Base"
# deps languages title="Languages"
# deps tools title="Tools"
# deps platforms title="Platform Tools"
# deps private title="Locations (Private)"

for egg in `ls  $EASTER_HOME/baskets/*.yml`; do
  install --yml ${egg}
done

. $HOME/easter/rc.bash

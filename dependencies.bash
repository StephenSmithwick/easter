#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
# deps base title="Base"
# deps languages title="Languages"
# deps tools title="Tools"
# deps platforms title="Platform Tools"
# deps private title="Locations (Private)"

for basket in `ls  $EASTER_HOME/baskets/*.yml`; do
  ruby -I $EASTER_HOME/src $EASTER_HOME/src/install.rb --yml ${basket}
done

. $HOME/easter/rc.bash

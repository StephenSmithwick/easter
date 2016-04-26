#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
deps base title="Base"
deps languages title="Languages"
deps tools title="Tools"

. $HOME/easter/rc.bash
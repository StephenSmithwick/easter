#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
deps base title="Base"
deps languages title="Languages"
deps tools title="Tools"
deps private title="Locations (Private)"

. $HOME/easter/rc.bash

#! /bin/bash

source "$HOME/easter/utilities.bash"

echo "Checking Easter Dependencies:"
deps base title="Base"
deps languages title="Languages"
deps persistence title="Persistence"
deps tools title="Tools"
deps gui title="GUI Tools"
deps platforms title="Platform Tools"
deps tasks title="Task Management Tools"
deps private title="Locations (Private)"

. $HOME/easter/rc.bash

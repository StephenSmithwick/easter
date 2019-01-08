#! /bin/bash

function location {
  local host_check message
  local "${@}"

  if [ ! -z ${host_check} ] && host -W .01 ${host_check} &> /dev/null; then
    echo "${message}"
    eval "${action}"
  fi
}

# Load Locations
for location in `ls -d $EASTER_HOME/locations/*/`; do
  if [ -f "${location}rc.bash" ]; then
    source "${location}rc.bash"
  fi
done

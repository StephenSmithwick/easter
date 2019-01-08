#! /bin/bash

function location {
  local host_check message
  local "${@}"

  if [ ! -z ${host_check} ] && host -W .01 ${host_check} &> /dev/null; then
    echo "${message}"
    eval "${action}"
  fi
}

function location_dep {
  local name=$1; shift
  local location gist
  local "${@}"

  if [ ! -z "${gist}" ] && [ ! -d "$EASTER_HOME/locations/${location}/.git" ]; then
    log "installing private location: ${name}"
    git clone "${gist}" "$EASTER_HOME/locations/${location}"
  else
    log "has setup: $name"
  fi
}

# Load Locations
for location in `ls -d $EASTER_HOME/locations/*/`; do
  if [ -f "${location}rc.bash" ]; then
    source "${location}rc.bash"
  fi
done

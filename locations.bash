#! /bin/bash

function location_dep {
  local name=$1; shift
  local location gist
  local "${@}"

  if [ ! -z "${gist}" ] && [ ! -d "$EASTER_HOME/locations/${location}/.git" ]; then
    echo "  🐣 Hatching: ${name}"
    git clone "${gist}" "$EASTER_HOME/locations/${location}"
  else
    echo "  🐤 Hatched: ${name}"
  fi
}

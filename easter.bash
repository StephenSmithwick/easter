#! /bin/bash

# Helper function
function easter() {
  if [[ "${@}" =~ "--skip-updates" ]]; then
    export EASTER_UPDATE=false
  fi

  if [[ "${@}" =~ "--help" ]]; then
    echo "easter [--help] [--skip-updates]"
    echo "   --reload        reload easter scripts in case of location change or script updates"
    echo "   --skip-updates  do not do any updates"
    echo "   --help          show this message"
  elif [[ "${@}" =~ "--reload" ]]; then
    source "$EASTER_HOME/rc.bash"
  else
    bash "$EASTER_HOME/fetch.bash"
  fi
  unset EASTER_UPDATE
}

export -f easter

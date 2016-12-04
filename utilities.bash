function log {
  echo " - Easter $@"
}

function dep {
  local name=$1; shift
  local file bin dir brew install update do_update
  local "${@}"
  if [ ! -z ${file} ] && [ ! -f "${file}" ]; then
    # Dependency file: $file not found
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${dir} ] && [ ! -d ${dir} ]; then
    # Dependency directory: $dir not found
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${bin} ] && [ ! $(command -v ${bin}) ]; then
    # Dependency executable: $bin not on path
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${brew} ] && !(brew ls ${brew} &> /dev/null || brew cask ls ${brew} &> /dev/null); then
    # Dependency brew formula: not found anywhere
    log "will install: $name"
    eval "${install}"
  else
    if [ ! -z ${update} ] && [ "${EASTER_UPDATE}" != false ]; then
      log "will update: $name"
      eval "${update}"
    else
      log "found already installed: $name"
    fi
  fi
}

function brew_dep {
  local name=$1; shift
  local brew install
  local "${@}"

  if [[ "${@}" =~ cask ]]; then
    function install {
      brew cask install ${brew}
    }
  else
    function install {
      brew install ${brew}
    }
  fi
  dep "${name}" ${@} install=install
}

function deps {
  local category=$1; shift
  local title
  local "${@}"

  echo "Easter ${title}: "
  . "$EASTER_HOME/deps/${category}.bash"
  echo
}

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

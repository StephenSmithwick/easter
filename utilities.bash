function log {		
  echo " - Easter $@"		
}

function dep {
  local name=$1; shift
  local file bin dir install
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
  else
    log "found already installed: $name"
  fi
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
  if [ ! -z ${host_check} ] && host ${host_check} &> /dev/null; then
    echo "${message}"
    eval "${action}"
  fi
}
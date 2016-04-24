function log {		
  echo " - Easter $@"		
}

function dep {
  local name=$1; shift
  local file bin install
  local "${@}"
  if [ ! -z ${file} ] && [ ! -f "${file}" ]; then
    # Dependency file not found
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${bin} ] && [ ! $(command -v ${bin}) ]; then
    # Dependency bin not on path
    log "will install: $name"
    eval "${install}"
  else
    log "found already installed: $name"
  fi
}
function log {		
  echo " - Easter $@"		
}

function dep {
  local name=$1; shift
  local file bin install
  local "${@}"
  if [ ! -z ${file} ] && [ ! -f "${file}" ]; then
    log "will install: $name"
    eval "${install}"
  elif [ ! -z ${bin} ] && [ ! $(command -v ${bin}) ]; then
    log "will install: $name"
    eval "${install}"
  else
    log "wont install: $name"
  fi
}
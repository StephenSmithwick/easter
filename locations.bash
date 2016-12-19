#! /bin/bash

# Load Locations
for location in `ls -d $EASTER_HOME/locations/*/`; do
  if [ -f "${location}rc.bash" ]; then
    source "${location}rc.bash"
  fi
done

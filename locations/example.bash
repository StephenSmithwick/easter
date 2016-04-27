#! /bin/bash

# [location].bash: files are all sourced by rc.bash when the terminal loads.
# The intention is to include location specific code excuted conditionally

function conditionally_executed_function {
  echo "This code is only executed if the location check passes"
}

location message="Example location message" action=conditionally_executed_function # host_check="example.lan.host.name.com" 

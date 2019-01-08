#! /bin/bash

# Bash Completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# AWS Tool bash completion
complete -C aws_completer aws

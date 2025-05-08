#!/bin/bash

for SSH_AUTH_SOCK in /tmp/vscode-ssh-auth*.sock; do
  if ssh-add -l >/dev/null 2>&1; then
    echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
    export SSH_AUTH_SOCK
  else
    rm -f $SSH_AUTH_SOCK
  fi
done

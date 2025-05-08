#!/bin/bash

cat <<EOF >> $HOME/.cargo/config.toml
[net]
git-fetch-with-cli = true
EOF

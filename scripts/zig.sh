#! /bin/bash

zvm=$(command -v zvm || true)
if [[ "$zvm" == "" ]]; then
  curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
else
  zvm upgrade
fi

target_version="0.15.1"
zvm install --zls --full $target_version

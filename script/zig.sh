#! /bin/bash

zvm=$(command -v zvm || true)
if [[ "$zvm" == "" ]]; then
  curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
else
  zvm upgrade
fi

zvm install --zls --full master

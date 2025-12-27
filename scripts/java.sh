#! /bin/bash

source ~/.emacs.d/init.sh

sdk=$(which sdk || true)
if [[ "$sdk" == "sdk not found" ]]; then
  curl -s "https://get.sdkman.io" | bash
else
  sdk selfupdate
fi

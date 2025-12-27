#! /bin/bash

source ~/.emacs.d/init.sh

sdk=$(which sdk || true)
if [[ "$sdk" == "sdk not found" ]]; then
  curl -s "https://get.sdkman.io" | bash
else
  sdk selfupdate
fi

target_version="25.0.1-tem"
sdk install java $target_version
sdk use java $target_version

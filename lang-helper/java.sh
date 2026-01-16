#! /bin/bash

[ -f $HOME/.sdkman/bin/sdkman-init.sh ] && source $HOME/.sdkman/bin/sdkman-init.sh

sdk=$(which sdk || true)
if [[ $sdk == "sdk not found" ]]; then
    curl -s "https://get.sdkman.io" | bash
else
    sdk selfupdate
fi

latest_version=$(sdk list java | grep 'Temurin' | awk -F '|' '{print $6}')
sdk install java $latest_version
sdk use java $latest_version

sdk flush

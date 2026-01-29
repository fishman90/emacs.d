#! /bin/bash

latest_version="30.2"

wget https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-"$latest_version".tar.gz
tar xvf emacs-"$latest_version".tar.gz

(
    cd emacs-emacs-"$latest_version" &&
        ./autogen.sh &&
        ./configure --with-native-compilation=aot &&
        make -j"$(nproc)" &&
        sudo make install
)

rm emacs-"$latest_version".tar.gz
rm -rf emacs-emacs-"$latest_version"

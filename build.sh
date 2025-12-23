#! /bin/bash

target_version="30.2"

wget https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-"$target_version".tar.gz
tar xvf emacs-"$target_version".tar.gz

(
  cd emacs-emacs-"$target_version"
  ./autogen.sh
  ./configure --with-native-compilation=aot
  make -j"$(nproc)"
  sudo make install
)

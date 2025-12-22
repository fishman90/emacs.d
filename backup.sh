#! /bin/bash

backup_time=$(date +%s)
backup_path="/data/emacs-bak-$backup_time"

mkdir "$backup_path"

(
  cp *.sh "$backup_path"
  cp *.el "$backup_path"

  cp -a -r configs "$backup_path"
  cp -a -r langs "$backup_path"
  cp -a -r scripts "$backup_path"
)

echo "done!"

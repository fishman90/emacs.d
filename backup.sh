#! /bin/bash

backup_time=$(date +%s)
backup_path="/data/emacs-bak-$backup_time"

mkdir "$backup_path"

(
  cp *.sh "$backup_path"
  cp *.el "$backup_path"

  mkdir "$backup_path"/configs
  mkdir "$backup_path"/langs

  cp configs/*.el "$backup_path/configs"
  cp langs/*.el "$backup_path/langs"

  cp -a -r scripts "$backup_path"
)

echo "done!"

;;-*- lexical-binding: t; -*-

(defun fishman/json-format ()
  (interactive)
  (when (use-region-p)
    (save-current-buffer)
    (shell-command-on-region
     (region-beginning)
     (region-end)
     "jq ."
     (current-buffer)
     t
     "*jq error*"
     t)
    (save-current-buffer)))

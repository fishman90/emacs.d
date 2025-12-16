;;-*- lexical-binding: t; -*-

(use-package anzu
  :after general
  :config ; nofmt
  (fishman-save-current-buffer-before 'anzu-query-replace)
  (general-define-key :keymaps 'override "M-r" 'anzu-query-replace))

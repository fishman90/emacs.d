;;-*- lexical-binding: t; -*-

(use-package verb
  :custom (verb-auto-show-headers-buffer t)
  :config ; nofmt
  (fishman-save-current-buffer-before 'verb-send-request-on-point-display)
  (general-define-key :keymaps 'org-mode-map "C-c C-r" 'verb-send-request-on-point-display))

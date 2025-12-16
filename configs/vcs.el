;;-*- lexical-binding: t; -*-

(use-package transient :commands transient--set-layout)

(use-package magit
  :hook (magit-status-mode . display-line-numbers-mode)
  :config (fishman-save-some-buffers-before 'magit-status))

;;-*- lexical-binding: t; -*-

(use-package transient :commands transient--set-layout)

(use-package magit
  :custom (magit-format-file-function 'magit-format-file-nerd-icons)
  :hook (magit-status-mode . display-line-numbers-mode)
  :config (fishman-save-some-buffers-before 'magit-status))

(use-package magit-todos :after magit :config (magit-todos-mode))

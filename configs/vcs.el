;;-*- lexical-binding: t; -*-

(use-package transient :commands transient--set-layout)

(use-package magit
  :custom (magit-format-file-function 'magit-format-file-nerd-icons)
  :bind ; nofmt
  ("C-x j" . magit-log-current)
  ("C-x y" . magit-log-buffer-file)
  :hook ; nofmt
  (magit-status-mode . display-line-numbers-mode)
  (magit-log-mode . display-line-numbers-mode)
  :config ; nofmt
  (fishman-save-some-buffers-before 'magit-status)
  (fishman-save-some-buffers-before 'magit-log-current)
  (fishman-save-some-buffers-before 'magit-log-buffer-file))

(use-package magit-todos :after magit :config (magit-todos-mode))

(use-package git-modes)

;;-*- lexical-binding: t; -*-

(use-package magit
  :init (require 'magit-diff)
  :custom (magit-format-file-function 'magit-format-file-nerd-icons)
  :bind ; nofmt
  ("C-x j" . magit-log-current)
  ("C-x y" . magit-log-buffer-file)
  ("C-x s" . magit-branch-checkout)
  :hook ; nofmt
  (magit-status-mode . display-line-numbers-mode)
  (magit-diff-mode . display-line-numbers-mode)
  (magit-log-mode . display-line-numbers-mode)
  (magit-revision-mode . display-line-numbers-mode)
  :config ; nofmt
  (fishman/save-some-buffers-before 'magit-status)
  (fishman/save-some-buffers-before 'magit-log-current)
  (fishman/save-some-buffers-before 'magit-log-buffer-file)
  (fishman/save-some-buffers-before 'magit-branch-checkout))

(use-package magit-todos :after magit :config (magit-todos-mode))

(use-package git-modes
  :hook (gitconfig-mode . (lambda () (setq-local tab-width 4))))

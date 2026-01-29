;;-*- lexical-binding: t; -*-

(use-package f)

(use-package dired-hacks-utils
  :after general
  :init (require 'dired)
  :config ; nofmt
  (general-define-key :keymaps 'dired-mode-map "a"
		      (lambda ()
			(interactive)
			(xref-push-marker-stack)
			(goto-char (point-min))
			(dired-hacks-next-file)))
  (general-define-key :keymaps 'dired-mode-map "z"
		      (lambda ()
			(interactive)
			(xref-push-marker-stack)
			(goto-char (point-max))
			(dired-hacks-previous-file))))

(use-package async :config (dired-async-mode))

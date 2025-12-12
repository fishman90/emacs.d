;;-*- lexical-binding: t; -*-

(use-package flycheck
  :after lsp-mode
  :custom (flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)
  :bind (:map lsp-mode-map
	      ("C-c C-c" .
	       (lambda ()
		 (interactive)
		 (flycheck-list-errors)
		 (switch-to-buffer-other-window flycheck-error-list-buffer))))
  :hook (lsp-mode .
		  (lambda ()
		    (unless (eq major-mode 'emacs-lisp-mode)
		      (flycheck-mode)))))

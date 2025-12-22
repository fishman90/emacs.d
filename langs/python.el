;;-*- lexical-binding: t; -*-

(use-package python-mode
  :bind (:map python-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (save-buffer)
		 (display-message-or-buffer
		  (shell-command-to-string
		   (format "autoflake --remove-all-unused-imports --remove-duplicate-keys --in-place %s"
			   (buffer-file-name))))
		 (revert-buffer t t t)
		 (python-isort-buffer)
		 (blacken-buffer))))
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp-deferred))))

(use-package lsp-pyright :custom (lsp-pyright-prefer-remote-env nil))

(use-package python-isort
  :config (fishman-save-current-buffer-around 'python-isort-buffer))

(use-package blacken
  :custom (blacken-line-length 100)
  :config (fishman-save-current-buffer-around 'blacken-buffer))

(use-package toml-mode
  :bind (:map toml-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (save-buffer)
		 (display-message-or-buffer
		  (shell-command-to-string
		   (format "tombi format %s" (buffer-file-name))))
		 (revert-buffer t t t))))
  :hook (toml-mode .
		   (lambda ()
		     (add-to-list
		      (make-local-variable 'lsp-disabled-clients)
		      'taplo)
		     (lsp-deferred))))

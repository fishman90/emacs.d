;;-*- lexical-binding: t; -*-

(use-package rust-mode
  :custom ((lsp-rust-analyzer-cargo-target-dir t)
	   (lsp-rust-analyzer-cargo-watch-command "clippy"))
  :bind (:map rust-mode-map ("M-\\" . fishman/lsp-format))
  :hook (rust-mode . lsp-deferred))

(use-package cargo-mode :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode
  :bind (:map toml-mode-map
	      ("C-\\" . fishman/smart-comment)
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

;;-*- lexical-binding: t; -*-

(use-package elixir-mode
  :custom (lsp-elixir-local-server-command
	   (expand-file-name "language_server.sh"
			     (string-trim
			      (shell-command-to-string "mise where elixir-ls"))))
  :bind (:map elixir-mode-map ("M-\\" . fishman/lsp-format))
  :hook (elixir-mode . lsp-deferred))

(use-package mix :hook (elixir-mode . mix-minor-mode))

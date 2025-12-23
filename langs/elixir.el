;;-*- lexical-binding: t; -*-

(use-package elixir-mode
  :custom ((lsp-elixir-incremental-dialyzer t)
	   (lsp-elixir-fetch-deps t)
	   (lsp-elixir-server-command '("elixir-ls")))
  :bind (:map elixir-mode-map ("M-\\" . fishman/lsp-format))
  :hook (elixir-mode . lsp-deferred))

(use-package mix :hook (elixir-mode . mix-minor-mode))

;;-*- lexical-binding: t; -*-

(use-package zig-mode
  :custom (zig-format-on-save nil)
  :bind (:map zig-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (if (use-region-p)
		     (zig-format-region (region-beginning) (region-end))
		   (zig-format-buffer)))))
  :hook (zig-mode . lsp-deferred)
  :config ; nofmt
  (fishman-save-current-buffer-around 'zig-format-region)
  (fishman-save-current-buffer-around 'zig-format-buffer))

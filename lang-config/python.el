;;-*- lexical-binding: t; -*-

(use-package python-mode
  :bind (:map python-mode-map
	      ("M-\\" .
	       (lambda ()
		 (interactive)
		 (save-buffer)
		 (display-message-or-buffer
		  (shell-command-to-string
		   (format "autoflake --remove-all-unused-imports --in-place %s"
			   (buffer-file-name))))
		 (revert-buffer t t t)
		 (python-isort-buffer)
		 (blacken-buffer))))
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp-deferred))))

(use-package lsp-pyright :custom (lsp-pyright-prefer-remote-env nil))

(use-package python-isort
  :config (fishman/save-current-buffer-around 'python-isort-buffer))

(use-package blacken
  :custom (blacken-line-length 100)
  :config (fishman/save-current-buffer-around 'blacken-buffer))

(defun fishman/install-python-grammar ()
  (interactive)
  (dolist (grammar
	   '((python . ("https://github.com/tree-sitter/tree-sitter-python"))))
    (add-to-list 'treesit-language-source-alist grammar)
    (unless (treesit-language-available-p (car grammar))
      (treesit-install-language-grammar (car grammar)))))

(use-package tree-sitter-langs)

(use-package tree-sitter :hook (python-mode . tree-sitter-mode))

(use-package transient :commands transient--set-layout)

(use-package combobulate
  :custom (combobulate-flash-node nil)
  :bind ; nofmt
  (:map python-mode-map ("M-k" . combobulate-kill-node-dwim))
  (:map python-mode-map ("M-m" . combobulate-mark-node-dwim))
  (:map python-mode-map
	("TAB" .
	 (lambda ()
	   (interactive)
	   (if (use-region-p)
	       (combobulate-python-indent-for-tab-command)
	     (py-indent-line)))))
  :config (fishman/save-current-buffer-before 'combobulate-mark-node-dwim))

;;-*- lexical-binding: t; -*-

(use-package symbols-outline
  :custom ((symbols-outline-no-other-window nil)
	   (symbols-outline-ignore-variable-symbols nil))
  :bind ("<f6>" . symbols-outline-show)
  :hook ; nofmt
  (lsp-mode .
	    (lambda ()
	      (setq-local symbols-outline-fetch-fn 'symbols-outline-lsp-fetch)))
  (prog-mode . symbols-outline-follow-mode))

(add-hook 'helm-before-initialize-hook
	  (lambda ()
	    (let ((window
		   (get-buffer-window symbols-outline-buffer-name)))
	      (when (window-valid-p window) (delete-window window)))))

(add-hook 'helm-cleanup-hook
	  (lambda ()
	    (let ((window
		   (get-buffer-window symbols-outline-buffer-name)))
	      (unless (window-valid-p window) (symbols-outline-show)))))

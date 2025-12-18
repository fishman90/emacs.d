;;-*- lexical-binding: t; -*-

(defun fishman-symbols-outline-toggle-fun ()
  (interactive)
  (let ((window (get-buffer-window symbols-outline-buffer-name)))
    (if (and window (window-live-p window))
	(delete-window window)
      (symbols-outline-show))))

(use-package symbols-outline
  :custom ((symbols-outline-no-other-window nil)
	   (symbols-outline-ignore-variable-symbols nil))
  :bind ("<f6>" . fishman-symbols-outline-toggle-fun)
  :hook ; nofmt
  (lsp-mode .
	    (lambda ()
	      (setq-local symbols-outline-fetch-fn 'symbols-outline-lsp-fetch)))
  (prog-mode . symbols-outline-follow-mode)
  :config ; nofmt
  (add-hook 'helm-before-initialize-hook
	    (lambda ()
	      (let ((window
		     (get-buffer-window symbols-outline-buffer-name)))
		(when (window-valid-p window) (delete-window window)))))
  (add-hook 'helm-cleanup-hook
	    (lambda ()
	      (let ((window
		     (get-buffer-window symbols-outline-buffer-name)))
		(unless (window-valid-p window)
		  (symbols-outline-show)))))

  (setq fishman-symbols-outline-window-exists nil)
  (setq fishman-current-selected-window nil)

  (advice-add 'undo-tree-visualize :before
	      (lambda (&rest _)
		(let ((window
		       (get-buffer-window symbols-outline-buffer-name)))
		  (when (and window (window-live-p window))
		    (setq fishman-symbols-outline-window-exists t)
		    (setq fishman-current-selected-window
			  (selected-window))
		    (delete-window window)))))
  (advice-add 'undo-tree-visualizer-quit :after
	      (lambda (&rest _)
		(when fishman-symbols-outline-window-exists
		  (setq fishman-symbols-outline-window-exists nil)
		  (setq fishman-current-selected-window nil)
		  (symbols-outline-show)
		  (select fishman-current-selected-window)))))

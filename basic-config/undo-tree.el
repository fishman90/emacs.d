;;-*- lexical-binding: t; -*-

(use-package undo-tree
  :custom ((undo-tree-history-directory-alist
	    `(("." .
	       ,(expand-file-name "undo-tree-history" user-emacs-directory))))
	   (undo-tree-visualizer-diff t)
	   (undo-tree-visualizer-timestamps t)
	   (undo-tree-visualizer-lazy-draw t))
  :config ; nofmt
  (advice-add 'undo-tree-save-history :around
	      (lambda (orig-fun &rest args)
		(let ((inhibit-message t)) (apply orig-fun args))))
  (global-undo-tree-mode))

;;-*- lexical-binding: t; -*-

(defun fishman-treemacs-toggle-fun ()
  (interactive)
  (setq treemacs-position 'left)
  (treemacs))

(use-package treemacs
  :custom ((treemacs-position 'left)
	   (treemacs-width-is-initially-locked nil)
	   (treemacs-silent-refresh t)
	   (treemacs-silent-filewatch t)
	   (treemacs-follow-after-init t)
	   (treemacs-recenter-after-file-follow 'always)
	   (vc-follow-symlinks t))
  :bind ("<f5>" . fishman-treemacs-toggle-fun)
  :config ; nofmt
  (setq treemacs--width-is-locked nil)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-filewatch-mode)
  (treemacs-follow-mode)
  (treemacs-project-follow-mode)
  (add-hook 'helm-before-initialize-hook
	    (lambda ()
	      (when (equal (treemacs-current-visibility) 'visible)
		(fishman-treemacs-toggle-fun))))
  (add-hook 'helm-cleanup-hook
	    (lambda ()
	      (unless (equal (treemacs-current-visibility) 'visible)
		(fishman-treemacs-toggle-fun))))

  (defvar fishman-treemacs-window-exists nil)

  (advice-add 'undo-tree-visualize :before
	      (lambda (&rest _)
		(when (equal (treemacs-current-visibility) 'visible)
		  (setq fishman-treemacs-window-exists t)
		  (fishman-treemacs-toggle-fun))))
  (advice-add 'undo-tree-visualizer-quit :after
	      (lambda (&rest _)
		(when fishman-treemacs-window-exists
		  (let ((window (selected-window)))
		    (setq fishman-treemacs-window-exists nil)
		    (fishman-treemacs-toggle-fun)
		    (select-window window))))))

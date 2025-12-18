;;-*- lexical-binding: t; -*-

(require 'conf-mode)

(define-key conf-unix-mode-map
	    (kbd "C-\\")
	    'fishman-smart-comment-fun)

(define-key conf-unix-mode-map
	    (kbd "M-\\")
	    (lambda ()
	      (interactive)
	      (if (use-region-p)
		  (indent-region (region-beginning) (region-end))
		(indent-region (point-min) (point-max)))))

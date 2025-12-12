;;-*- lexical-binding: t; -*-

(require 'sh-script)

(custom-set-variables
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(sh-indent-comment t))

(fishman-save-current-buffer-around 'indent-region)

(define-key sh-mode-map
	    (kbd "M-\\")
	    (lambda ()
	      (interactive)
	      (if (use-region-p)
		  (indent-region (region-beginning) (region-end))
		(indent-region (point-min) (point-max)))))

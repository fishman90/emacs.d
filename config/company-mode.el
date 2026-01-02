;;-*- lexical-binding: t; -*-

(use-package company
  :custom ((company-tooltip-align-annotations t)
	   (company-minimum-prefix-length 1)
	   (company-selection-wrap-around t))
  :hook ; nofmt
  (prog-mode .
	     (lambda ()
	       (setq-local company-backends
			   '((company-capf :with company-yasnippet)
			     company-files))))
  (text-mode .
	     (lambda ()
	       (setq-local company-backends
			   '(company-ispell company-dabbrev))))
  :config (global-company-mode))

(use-package company-restclient
  :hook (org-mode .
		  (lambda ()
		    (add-to-list
		     (make-local-variable 'company-backends)
		     'company-restclient))))

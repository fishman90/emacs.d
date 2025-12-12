;;-*- lexical-binding: t; -*-

(use-package company
  :custom ((company-tooltip-align-annotations t)
	   (company-minimum-prefix-length 1)
	   (company-selection-wrap-around t))
  :config (global-company-mode))

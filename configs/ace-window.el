;;-*- lexical-binding: t; -*-

(use-package ace-window :bind ("C-o" . ace-select-window))

(use-package windsize
  :custom ((windsize-rows 1)
	   (windsize-cols 1))
  :config				; nofmt
  (general-define-key :keymaps 'override "M-<up>" 'windsize-up)
  (general-define-key :keymaps 'override "M-<down>" 'windsize-down)
  (general-define-key :keymaps 'override "M-<left>" 'windsize-left)
  (general-define-key :keymaps 'override "M-<right>" 'windsize-right))

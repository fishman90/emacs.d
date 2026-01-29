;;-*- lexical-binding: t; -*-

(use-package straight-utils
  :straight (:type git :host github :repo "fishman90/straight-utils" :files
		   ("*.el" "Cargo.*" "src"))
  :config (fishman/save-some-buffers-before 'straight-utils-pull-all))

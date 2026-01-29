;;-*- lexical-binding: t; -*-

(customize-set-value 'package-enable-at-startup nil)

(setenv "LSP_USE_PLISTS" "true")

(setq gc-cons-threshold (* 1024 1024 1024))
(setq gc-cons-percentage 0.8)

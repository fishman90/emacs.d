;;-*- lexical-binding: t; -*-

(customize-set-value 'package-enable-at-startup nil)

(setq load-prefer-newer t)
(setq native-comp-async-report-warnings-errors 'silent
      native-comp-jit-compilation t)

(setenv "LSP_USE_PLISTS" "true")

(require 'rust-mode)
;;https://github.com/rust-lang/rust-mode
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
;;(setq rust-format-on-save t)
(provide 'setup-rust)

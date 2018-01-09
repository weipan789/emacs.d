(require 'autopair)
(require 'paredit)

;;----------------------------------------------------------------------------
;;自动添加另一半括号
;;https://github.com/joaotavora/autopair
;;----------------------------------------------------------------------------
(autopair-global-mode) ;; enable autopair in all buffers

;;----------------------------------------------------------------------------
;;操作圆括号和方括号,移动删除添加等
;;https://www.emacswiki.org/emacs/ParEdit
;;----------------------------------------------------------------------------
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(provide 'setup-paredit)

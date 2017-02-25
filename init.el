(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))
(setq emacs-load-start-time (current-time))
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;; load the packaged named xyz.
(load "xyz") ;; best not to include the ending “.el” or “.elc”

(require 'dired+)

;;system-type 显示系统类型
;;添加定制的el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


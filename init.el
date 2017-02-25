
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives             '("tromey" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives             '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize))
(setq emacs-load-start-time (current-time))
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;; load the packaged named xyz.
(load "xyz") ;; best not to include the ending “.el” or “.elc”

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    ;;projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    auto-complete
    ace-jump-mode
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'dired+)

;;自动补全绑定
;;(ac-set-trigger-key "TAB")
;;auto-complete command,激活
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)



(autoload
  'ace-jump-mode
  "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;;system-type 显示系统类型
;;添加定制的el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


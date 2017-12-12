(defconst sanityinc-no-ssl (or (< emacs-major-version 24)
                               (and (memq system-type '(windows-nt ms-dos))
                                    (not (gnutls-available-p)))))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnuchina"   . "http://elpa.emacs-china.org/gnu/") t)
  (add-to-list 'package-archives '("melpachina" . "http://elpa.emacs-china.org/melpa/") t)
  ;;  (add-to-list 'package-archives '("melpas" . "https://melpa.org/packages/") t)
  (package-initialize))

(setq idea-projects "~/IdeaProjects/")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;使用最新的org-mode  git clone git://orgmode.org/org-mode.git
(add-to-list 'load-path (expand-file-name " org-mode/lisp" idea-projects))
(add-to-list 'load-path (expand-file-name " org-mode/contrib/lisp" idea-projects))


(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


(setq emacs-load-start-time (current-time))
(setq user-emacs-directory "~/.emacs.d/")
;;添加定制的el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;;(format "The value of fill-column is %d." fill-column)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path "~/Documents/emacs-plugins/yasnippet")


(setq my-config (expand-file-name "my-config.el" user-emacs-directory))
(when (file-exists-p my-config)
  (load my-config))
(when (file-exists-p custom-file)
  (load custom-file))


(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
;;(require 'setup-editing)



;; load the packaged named xyz.
(load "xyz") ;; best not to include the ending “.el” or “.elc”

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(paredit clojure-mode clojure-mode-extra-font-locking cider
    ido-ubiquitous smex
    rainbow-delimiters tagedit
    magit
    ;;dired+
    auto-complete
    ace-jump-mode
    ecb
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    ;;(package-install p)
    ))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'dracula t)
;;(load-theme 'intellij t)
;;(load-theme 'zenburn t)

;;(require 'dired+)
(require 'init-setting)
;;(require 'init-themes)
;;自动补全绑定
;;(ac-set-trigger-key "TAB")
;;auto-complete command,激活
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)



;;(autoload  'ace-jump-mode  "ace-jump-mode" t)
;;(eval-after-load "ace-jump-mode"  '(ace-jump-mode-enable-mark-sync))

;;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;;system-type 显示系统类型
;;(require 'yasnippet)
;;(yas-global-mode 1)

(provide 'init)
(put 'upcase-region 'disabled nil)

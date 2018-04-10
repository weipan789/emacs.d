(defconst sanityinc-no-ssl (or (< emacs-major-version 24)
                               (and (memq system-type '(windows-nt ms-dos))
                                    (not (gnutls-available-p)))))
;;----------------------------------------------------------------------------
;;设置源
;;----------------------------------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
  ;;(add-to-list 'package-archives '("gnuchina"   . "https://elpa.emacs-china.org/gnu/") t)
  ;;(add-to-list 'package-archives '("melpachina" . "https://elpa.emacs-china.org/melpa-stable/") t)
  ;;(add-to-list 'package-archives '("orgchina" . "https://elpa.emacs-china.org/org/") t)
  (package-initialize))

;;----------------------------------------------------------------------------
;;设置路径
;;----------------------------------------------------------------------------
(setq idea-projects "~/IdeaProjects/")
(setq user-emacs-directory "~/.emacs.d/")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;使用最新的org-mode  git clone git://orgmode.org/org-mode.git
(add-to-list 'load-path (expand-file-name " org-mode/lisp" idea-projects))
(add-to-list 'load-path (expand-file-name " org-mode/contrib/lisp" idea-projects))
(setq emacs-load-start-time (current-time))

;;添加定制的el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;;(format "The value of fill-column is %d." fill-column)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path "~/Documents/emacs-plugins/yasnippet")

;;----------------------------------------------------------------------------
;;添加自定义文件
;;----------------------------------------------------------------------------
(setq my-config (expand-file-name "my-config.el" user-emacs-directory))
(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(when (file-exists-p my-config)
  (load my-config))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;;安装插件
;;----------------------------------------------------------------------------
(defvar my-packages
  '(
    clojure-mode clojure-mode-extra-font-locking cider
    rainbow-delimiters tagedit
    paredit autopair highlight-parentheses
    magit
    ace-jump-mode
    rust-mode
    ;;ecb
    js2-mode js2-refactor xref-js2 prettier-js
    markdown-mode
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
   (package-install p)
    ))

;;----------------------------------------------------------------------------
;;加载我的插件配置
;;----------------------------------------------------------------------------
(require 'init-setting)
(require 'setup-general)
(if (version< emacs-version "24.4");;如果版本小24.4加载后面两个配置
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
(require 'setup-cedet)
(require 'setup-editing)
;;(require 'dired+)
(require 'setup-paredit)
(require 'setup-highlight-parentheses)
(require 'setup-org)
(require 'setup-rust)
(require 'setup-markdown)
;;end
(provide 'init)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

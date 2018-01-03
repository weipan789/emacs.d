(tool-bar-mode 0)  
(menu-bar-mode 0)  
;;(Scroll-bar-mode 0)

;;(load-theme 'wombat t)
;;(set-default-font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")


;;绑定快捷键到magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(provide 'init-setting)

;;自动回行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;发布
(setq org-publish-project-alist
      '(
        ("org-static"
         :base-directory "~/Downloads/org-mode-assert/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|woff2"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org-notes"
         :base-directory "~/Documents/wpdeblog/"
         :base-extension "org"
         :exclude "code/"   ;; regexp
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-sitemap t ; 自动生成站点地图
         ;;:sitemap-filename "index.org" ; 站点地图的文件名
	 :sitemap-title "coderwei" ; 站点的标题
         ;;         :auto-preamble t
         :Html-link-home "index.html"    ; Just the default for this project.
         :html-link-up "index.html"    ; Just the default for this project.
         :html-head-include-default-style nil ;Disable the default css style
         :html-head-include-scripts nil ;Disable the default javascript snippet
         :html-head "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n

<link rel=\"stylesheet\" type=\"text/css\" href=\"http://www.coderwei.com/wp/org-mode-assert/css/v1/worg.css\"/>\n
<link rel=\"stylesheet\" type=\"text/css\" href=\"http://www.coderwei.com/wp/org-mode-assert/css/v1/main.css\"/>\n
<script type=\"text/javascript\" src=\"http://www.coderwei.com/wp/org-mode-assert/js/v1/jquery-3.2.1.min.js\"></script>\n
<script type=\"text/javascript\" src=\"http://www.coderwei.com/wp/org-mode-assert/js/v1/main.js\"></script>"
                                        ;Enable custom css style and other tags
         )
        ("org" :components ("org-notes" "org-static"))
        ))
(provide 'setup-org)

; start package.el with emacs
(require 'package)
; add MELPA to respository list
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
; initialize package.el
(package-initialize)

; start auto-complete with emacs
(require 'auto-complete)

; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories "/usr/include")
  (add-to-list 'achead:include-directories "/usr/include/c++/4.9.2/")
  (add-to-list 'achead:include-directories "/usr/lib/gcc/x86_64-unknown-linux-gnu/4.9.2/include")
 )

; now call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
; Fix iedit bug
(define-key global-map (kbd "C-c ;") 'iedit-mode)
; start flymake-google-cpplint-load
; define a function for flymake initialization
(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

; enable ess mode
(setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
(require 'ess-site)

; enable markdown-mode
(autoload 'gfm-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

; enable polymodes
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
;(add-to-list 'auto-mode-alist '("\\.Rhtml" . poly-html+r-mode))
;(add-to-list 'auto-mode-alist '("\\.Rcpp" . poly-r+c++-mode))

; activate AUCTeX and preview-latex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)





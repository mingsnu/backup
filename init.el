;;(setq mac-option-modifier 'super)
;;(setq mac-command-modifier 'meta)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; auto-complete
;;(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; auto-complete-c-headers
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

; enable ess mode
; (setq load-path (cons "/usr/share/emacs/site-lisp/ess" load-path))
; (setq inferior-julia-program-name "/usr/local/bin/julia")
 (require 'ess-site)

; activate AUCTeX and preview-latex
(load "auctex.el" nil t t)

; enable markdown-mode
(autoload 'gfm-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . gfm-mode))
;; using pandoc as markdown generating tools
;; customize R shebang
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(insert-shebang-custom-headers nil)
 '(insert-shebang-env-path "/usr/bin/env")
 '(insert-shebang-file-types
   (quote
    (("py" . "python")
     ("sh" . "bash")
     ("pl" . "perl")
     ("R" . "R"))))
 '(markdown-command "/usr/local/bin/pandoc"))

; enbable flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)

; autopair
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

; iedit
; Ref: http://www.masteringemacs.org/article/iedit-interactive-multi-occurrence-editing-in-your-buffer
(require 'iedit)
(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))
(global-set-key (kbd "C-;") 'iedit-dwim)

(defcustom python-shell-interpreter "python3"
  "Default Python interpreter for shell."
  :type 'string
  :group 'python)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(require 'insert-shebang)
(require 'header2-snps)

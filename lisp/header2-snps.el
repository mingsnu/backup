;;; header2-customize.el --- 
;;; Modified header2 template from https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-header2.el

;; To have Emacs update file headers automatically whenever you save a
;; file, put this in your init file (~/.emacs):
(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

;; To have Emacs add a file header whenever you create a new file in
;; some mode, put this in your init file (~/.emacs):
(autoload 'auto-make-header "header2")
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook   'auto-make-header)
(add-hook 'text-mode-hook 'auto-make-header)
(add-hook 'R-mode-hook 'auto-make-header)
(add-hook 'python-mode-hook 'auto-make-header)
(add-hook 'sh-mode-hook 'auto-make-header)

;; (setq header-date-format  "%b %e %Y (%R) ")

(defsubst header-email ()
  (insert header-prefix-string "Contact: mingsnu@gmail.com\n"))


(setq make-header-hook '(
                         ;;header-mode-line
                         ;;header-title
			 header-end-line
                         ;;header-blank
			 header-file-name
                         ;;header-status
                         ;;header-copyright
                         header-author
			 header-email
                         ;;header-maintainer
                         ;;header-blank
			 ;;header-description
                         header-creation-date
                         ;;header-rcs-id
                         header-version
                         ;;header-sccs
			 header-modification-date
			 header-modification-author
			 ;;header-update-count
			 ;;header-end-line
                         ;;header-url
                         ;;header-keywords
                         ;;header-compatibility
                         ;;header-free-software
                         ;;header-blank
                         ;;header-lib-requires
					;header-blank
					;header-end-line
                         header-commentary
                         ;;header-blank
                         ;;header-blank
                         ;;header-blank
                         ;;header-end-line
                         ;;header-history
                         ;;header-rcs-log
                         ;;header-blank
                         ;;header-blank
                         header-end-line
                         ;;header-free-software
                         ;;header-code
                         ;;header-eof
                         ))
(provide 'header2-customize)
;;; header2-customize.el ends here

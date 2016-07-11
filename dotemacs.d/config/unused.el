;***********************
;; DON'T KNOW WHAT THIS DOES
;***********************
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))

(defun abs-emacs-lisp-hook ()
  (local-set-key [(control c) e] 'eval-region)
)
(add-hook 'emacs-lisp-mode-hook 'abs-emacs-lisp-hook)

(defun insert-newline ()
  "Inserts a newline without moving the point"
  (interactive) 
  (save-excursion
    (insert-string "\n")
  )
)

(defun delete-previous-word ()
  "Delete the word on or before the cursor"
  (interactive)
  (forward-word -1)
  (delete-region (point) (progn (forward-word 1) (point)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIRED
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'dired)

(autoload 'dired-rcs-mark-rcs-locked-files "dired-rcs")
(autoload 'dired-rcs-mark-rcs-files        "dired-rcs")

(setq dired-copy-preserve-time t)
(setq dired-load-hook 
      '(lambda () 
         (load "dired-x")
         (define-key dired-mode-map "," 'dired-rcs-mark-rcs-files)
         (define-key dired-mode-map "\M-," 'dired-rcs-mark-rcs-locked-files)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Customize Settings
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(backup-by-copying t)
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(comint-completion-autolist t)
 '(comint-completion-recexact t)
 '(cperl-close-paren-offset -2)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-linefeed nil)
 '(cperl-indent-level 4)
 '(cperl-label-offset -4)
 '(cperl-min-label-indent 2)
 '(cperl-pod-here-fontify nil)
 '(cperl-pod-here-scan nil)
 '(custom-magic-show-button t)
 '(custom-magic-show-hidden (quote (group option face)))
 '(delete-key-deletes-forward t)
 '(fill-column 75)
 '(line-number-mode t)
 '(lpr-printer-switch "-d")
;emacserror '(pending-delete-mode t nil (pending-del))
 '(pr-file-duplex t)
 '(pr-file-landscape t)
 '(pr-ps-printer-alist (quote ((lonlw28 "lp" nil "-d" "lonlw28") (lonlw34 "lp" nil "-d" "lonlw34"))))
 '(printer-name "lonlw28")
 '(ps-printer-name-option "-d")
 '(query-user-mail-address nil)
 '(toolbar-visible-p nil)
 '(user-mail-address "karl.sigurdsson@aspex-semi.com")
 '(verilog-auto-endcomments nil)
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Custom Mode Font Colours
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-faces
 '(cperl-array-face ((((class color) (background light)) (:foreground "Blue" :bold t))))
 '(custom-set-face ((((class color)) (:foreground "blue" :background "white" :stipple "~/.emacs.d/xpm/white.xpm"))))
 '(custom-state-face ((((class color) (background light)) (:foreground "green2"))))
 '(font-lock-reference-face ((((class color) (background light)) (:foreground "orange")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Custom Mode Variables
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(cperl-continued-statement-offset 4)
 '(verilog-indent-level 2 t)
 '(fill-column 75)
 '(backup-by-copying t)
 '(cperl-label-offset -4)
 '(delete-key-deletes-forward t)
 '(cperl-electric-linefeed nil)
 '(column-number-mode t)
 '(cperl-close-paren-offset -2)
 '(verilog-auto-endcomments nil t)
 '(cperl-pod-here-fontify nil)
 '(verilog-indent-level-module 2 t)
 '(verilog-indent-level-behavioral 2 t)
 '(comint-completion-autolist t)
 '(toolbar-visible-p nil)
 '(cperl-indent-level 4)
 '(line-number-mode t)
 '(custom-magic-show-hidden (quote (group option face)))
 '(cperl-min-label-indent 2)
 '(custom-magic-show-button t)
 '(c-basic-offset 2)
 '(comint-completion-recexact t)
 '(verilog-indent-level-declaration 2 t)
 '(cperl-pod-here-scan nil)
 '(query-user-mail-address nil))

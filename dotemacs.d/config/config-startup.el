;--------------------------------------------------------------------------------
; basic requires

;(require 'simple)
;(require 'indent)

;tabify will remove space characters and insert TABs, effectively making the file smaller
;(require 'tabify)

;--------------------------------------------------------------------------------
; Tabs vs Spaces

; All indentation to be made with spaces.
; indent-tabs-mode is a per-buffer variable.
; Use setq-default to set this as the default mode for all buffers unless the
; buffer mode settings specifically want to use tabs and override it. 
(setq-default indent-tabs-mode nil)

;--------------------------------------------------------------------------------
; Parentheses matching

(require 'paren)
(show-paren-mode 1)
(set-face-background 'show-paren-match "blue")
(set-face-foreground 'show-paren-match "white")
(set-face-attribute  'show-paren-match nil :weight 'extra-bold)

;--------------------------------------------------------------------------------
; Tabbed Buffers

(require 'config-tabbar)

;--------------------------------------------------------------------------------
; Misc

;; silently load bytecomp
(load "bytecomp" nil t)

;; LOAD Version control system
(require 'vc)

; Don't show the start-up buffer each time emacs starts
(setq inhibit-startup-screen t)

; Don't offer to save abbreviations each time emacs closes
(setq save-abbrevs nil)

; Place the scroll-bar on the right
(set-scroll-bar-mode 'right)

; Don't show the button toolbar
(tool-bar-mode -1)

;; safe locals
;; we mark these as 'safe', so emacs won't give annoying warnings
(setq safe-local-variable-values
      (quote ((folded-file . t)
              (folding-mode . t))))

; Basic configuations
;(setq default-major-mode text-mode)          ; new files in auto-filled text mode
(setq mouse-motion-handler nil)              ; kludge to prevent stupid errors
(setq next-line-add-newlines nil)            ; prevent auto add newlines at EOF
(setq help-selects-help-window nil)          ; keep current buffer selected

(column-number-mode 1)
(line-number-mode 1)

; Don't auto wrap lines
(setq-default truncate-lines t)

(setq lpr-command "enscript")
(setq compile-command "make")

; backups, those damned ~ files
(setq make-backup-files nil)                 ; prevent backups
(setq version-control 'never)                ; never make numbered backups

; auto save
(auto-save-mode t)                           ; enable auto-save mode
(setq auto-save-default t)                   ; autosave all visited files
(setq delete-auto-save-files t)		     ; delete autosaved file on proper save
(setq auto-save-interval 500)		     ; the number of keystrokes before autosaving
;(setq auto-save-visited-file-name t)	     ; autosaves to actual file

; Save places in files for when reloading them
(require 'saveplace)
(setq-default save-place t)
(setq save-place-version-control 'never)

; Ask emacs to tell me, when I type an extended-command, if it is bound to a
(set-variable 'teach-extended-commands-p 'true)

; Emacs will warn you if you try to save a file without final newline
(set-variable 'require-final-newline 1)

(setq minibuffer-max-depth nil)

; Simple menus
(setq complex-buffers-menu-p nil)

; To determine if file already in a buffer follow links and look at the actual
; names.
(setq find-file-compare-truenames t)

; Set the buffers visited file-name to be the real file not a link name.
(setq find-file-use-truenames nil)
(setq next-line-add-newlines nil)

; Use directory names in buffer names
; e.g. If opened two files called 'Makefile' the buffer names will be prefixed 
; with part of the path name instead of 'Makefile' and 'Makefile<2>'
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; PRINTING
;(require 'printing)
;(setq pr-gv-command    "ghostview")

; Window title
(setq frame-title-format
  '((:eval (if (buffer-file-name)
	       (abbreviate-file-name (buffer-file-name))
	     "%b"))))

(provide 'config-startup)

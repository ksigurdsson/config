; Default Schema Settings
; Note: Colours may be set by name, mixing names or hex RGB value
;       e.g. "blue", "yellowgreen" or "#440000"
;
; Use: M-x list-faces-display to see all the faces and what they look like
; Use: M-x list-colors-display
; Use: M-x describe-font to describe the current font

;--------------------------------------------------------------------------------
; Faces (collection of textual attributes, such as fonts and colors)

;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")
    (setq my-font "Courier-12:weight=normal")
    (setq my-bold-font "Courier-12:weight=bold")
    )
  )
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Mac OS X")
    ;(setq my-font "-*-Lucida Sans Typewriter-normal-normal-semicondensed-*-10-*-*-*-p-0-iso10646-1")
    ;(setq my-bold-font "-*-Lucida Sans Typewriter-bold-normal-semicondensed-*-10-*-*-*-p-0-iso10646-1")
    (setq my-font "Courier New-11:weight=normal")
    (setq my-bold-font "Courier New-11:weight=bold")
    )
  )
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux")
    (setq my-font "-*-lucidatypewriter-medium-*-*-sans-12-*-*-*-*-*-*-*")
    (setq my-bold-font "-*-lucidatypewriter-bold-*-*-sans-12-*-*-*-*-*-*-*")
    )
  )
 )

;--------------------------------------
; default face (everything inherits from this)
(set-face-font       'default my-font)
(set-face-foreground 'default "white")  ;Normal
(set-face-background 'default "gray15") ;Normal
;(set-face-foreground 'default "black") ;Projector
;(set-face-background 'default "white") ;Projector

;--------------------------------------
; Set cursor color to white
(set-face-background 'cursor "white") ;Normal

;--------------------------------------
; Bold/Italics
(set-face-font 'italic      my-font)
(set-face-font 'bold        my-bold-font)
(set-face-font 'bold-italic my-bold-font)

;--------------------------------------
; Bottom of buffer line
;(set-face-font       'modeline my-font)
;(set-face-foreground 'modeline "black")
;(set-face-background 'modeline "gray")

;--------------------------------------
; Searching
(set-face-font       'isearch my-font)
(set-face-foreground 'isearch "blue")
(set-face-background 'isearch "grey")

(set-face-font       'lazy-highlight my-font)
(set-face-foreground 'lazy-highlight "red")
(set-face-background 'lazy-highlight "grey15")

;--------------------------------------
; Comments
(set-face-font       'font-lock-comment-face my-font)
(set-face-foreground 'font-lock-comment-face "green")

;--------------------------------------
; Highlight/Selection
(set-face-font       'highlight my-bold-font)
(set-face-foreground 'highlight "blue")
(set-face-background 'highlight "yellow")

(set-face-font       'secondary-selection my-font)
(set-face-foreground 'secondary-selection "blue")

;--------------------------------------
; Function Names
(set-face-font       'font-lock-function-name-face my-bold-font)
(set-face-foreground 'font-lock-function-name-face "orange")
;(set-face-foreground 'font-lock-function-name-face "hotpink")

;--------------------------------------
; Types
(set-face-font       'font-lock-type-face my-font)
(set-face-foreground 'font-lock-type-face "cyan")
;(set-face-foreground 'font-lock-type-face "yellowgreen")
;(set-face-foreground 'font-lock-type-face "light blue")

;--------------------------------------
; Variables
(set-face-font       'font-lock-variable-name-face my-font)
(set-face-foreground 'font-lock-variable-name-face "mediumpurple")
;(set-face-foreground 'font-lock-variable-name-face "violetred")

;--------------------------------------
; Pre-processor
(set-face-font       'font-lock-preprocessor-face  my-font)
(set-face-foreground 'font-lock-preprocessor-face "violet")
;(set-face-foreground 'font-lock-preprocessor-face "skyblue")

;--------------------------------------
; Strings
(set-face-font       'font-lock-string-face my-font)
(set-face-foreground 'font-lock-string-face "yellow")
;(set-face-foreground 'font-lock-string-face "cyan")
(set-face-underline-p 'font-lock-string-face nil)

;--------------------------------------
; Keywords
(set-face-font       'font-lock-keyword-face my-bold-font)
(set-face-foreground 'font-lock-keyword-face "yellow")

;--------------------------------------
; Pointer (mouse cursor)
(setq x-pointer-foreground-color "black")
(setq x-pointer-background-color "white")

;--------------------------------------
; Misc
;(set-face-foreground 'custom-variable-tag-face "yellow")
;(set-face-foreground 'widget-field-face "darkblue")

;--------------------------------------------------------------------------------
; Font Lock

;; Don't really need these but they prevent
;; font-lock from setting the fonts at start up.
(defvar font-lock-use-colors  t)
(defvar font-lock-use-fonts   nil)
(defvar font-lock-maximum-decoration t)
  
;; Load font-lock
(require 'font-lock)

(setq-default font-lock-auto-fontify t) 
(setq-default font-lock-use-colors '(color))
(setq-default font-lock-maximum-decoration t)
(setq-default font-lock-maximum-size 256000)
(setq-default font-lock-mode-enable-list t)
(setq-default font-lock-mode-disable-list nil)

(remove-hook 'font-lock-mode-hook 'turn-on-fast-lock)
(remove-hook 'font-lock-mode-hook 'turn-on-lazy-shot)
;(add-hook 'font-lock-mode-hook  'turn-on-fast-lock)

(provide 'config-schema)

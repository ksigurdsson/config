; Default Schema Settings
; Note: Colours may be set by name, mixing names or hex RGB value
;       e.g. "blue", "yellowgreen" or "#440000"
;
; Use: M-x list-faces-display to see all the faces and what they look like
; Use: M-x list-colors-display

;--------------------------------------------------------------------------------
; Faces (collection of textual attributes, such as fonts and colors)

(setq my-font "-*-lucidatypewriter-medium-*-*-sans-12-*-*-*-*-*-*-*")
(setq my-bold-font "-*-lucidatypewriter-bold-*-*-sans-12-*-*-*-*-*-*-*")

;--------------------------------------
; default face (everything inherits from this)
(set-face-font       'default my-font)
(set-face-foreground 'default "white")  ;Normal
(set-face-background 'default "gray15") ;Normal
;(set-face-foreground 'default "black") ;Projector
;(set-face-background 'default "white") ;Projector

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

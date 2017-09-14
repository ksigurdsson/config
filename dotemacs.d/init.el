;------------------------------------------------------------------------------
; emacs Initialisation File
;
; Karl Sigurdsson
; Feb 2013
;------------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/prog_modes")

(add-to-list 'custom-theme-load-path "~/.emacs.d/config/themes/")

; Configure emacs packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

; Configure startup settings
(require 'config-startup)

; Configure schema (font/colours) settings
(require 'config-schema)

; Configure keybindings
(require 'config-keybindings)

; Configure modes
(require 'config-modes)

;(load-theme 'zenburn t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9eb649b14e44b735b35d8e8a5eb2fd832eee0aed8929dfe143b9cf92c0b7658c" default)))
 '(safe-local-variable-values
   (quote
    ((folding-internal-margins)
     (folding-file . t)
     (folded-file . t)
     (folding-mode . t))))
 '(tabbar-separator (quote (0.5))))

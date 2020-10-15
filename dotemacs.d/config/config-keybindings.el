; Default Key Bindings

; make delete delete foreard
(setq delete-key-deletes-forward t)

(global-unset-key "\C-z")

(global-set-key '[f1] 'goto-line)
(global-set-key '[f2] 'start-kbd-macro)
(global-set-key '[f3] 'end-kbd-macro)
(global-set-key '[f4] 'call-last-kbd-macro)
(global-set-key '[f5] 'replace-string)
(global-set-key '[f6] 'indent-region)
(global-set-key '[f7] 'compile)
(global-set-key '[f8] 'revert-buffer)
(global-set-key '[f9] 'help)

(cond
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (message "Disabling Mac Right Option Key")
    (setq-default mac-right-option-modifier nil)
    )
  )
 )

;; wheel mouse
(setq imwheel-scroll-interval 2)
(defun imwheel-scroll-down-some-lines ()
  (interactive)
  (scroll-down imwheel-scroll-interval))
(defun imwheel-scroll-up-some-lines ()
  (interactive)
  (scroll-up imwheel-scroll-interval))

(global-set-key [mouse-4] 'imwheel-scroll-down-some-lines)
(global-set-key [mouse-5] 'imwheel-scroll-up-some-lines)


;The following sets up ctrl-middle click for cut
(global-unset-key '[(control down-mouse-2)])
(global-set-key   '[(control mouse-2)]    'kill-region)

;;(global-set-key '[prior] 'scroll-down)
;;(global-set-key '[next] 'scroll-up)
 
(global-set-key '[(control kp-up)]    'scroll-down)
(global-set-key '[(control kp-down)]  'scroll-up)
(global-set-key '[(control kp-left)]  'scroll-right)
(global-set-key '[(control kp-right)] 'scroll-left)
 
(global-set-key '[redo] 'repeat-complex-command)
(global-set-key '[props] 'font-lock-mode)
(global-set-key '[undo] 'undo)
(global-set-key '[copy] 'copy-region-as-kill)
(global-set-key '[(control t)] 'copy-region-as-kill)
(global-set-key '[paste] 'yank)
(global-set-key '[find] 'isearch-forward)
(global-set-key '[(shift find)] 'isearch-backward)
(global-set-key '[cut] 'kill-region)
;emacserror(global-set-key 'insert 'overwrite-mode)

(global-set-key "\M-f"     'font-lock-fontify-buffer)
(global-set-key "\M-r"     'revert-buffer)

;emacserror(global-set-key 'kp_5 'undefined)
;emacserror(global-set-key 'Delete 'delete-char)
;emacserror(global-set-key 'BackSpace 'backward-delete-char)
(global-set-key '[(control x) (control c)] 'kill-emacs)

(provide 'config-keybindings)

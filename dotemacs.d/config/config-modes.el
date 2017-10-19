; Default Mode Settings

;; Hooks for turning on font lock in modes not mentioned later on
(add-hook 'armasm-mode-hook     'turn-on-font-lock t)
(add-hook 'sh-mode-hook         'turn-on-font-lock t)
(add-hook 'ksh-mode-hook        'turn-on-font-lock t)
(add-hook 'csh-mode-hook        'turn-on-font-lock t)
(add-hook 'emacs-lisp-mode-hook	'turn-on-font-lock t) 
(add-hook 'lisp-mode-hook	'turn-on-font-lock t)
(add-hook 'c-mode-hook		'turn-on-font-lock t)
(add-hook 'c++-mode-hook	'turn-on-font-lock t)
(add-hook 'vera-mode-hook	'turn-on-font-lock t)
(add-hook 'perl-mode-hook	'turn-on-font-lock t)
(add-hook 'cperl-mode-hook	'turn-on-font-lock t)
(add-hook 'makefile-mode-hook	'turn-on-font-lock t)
(add-hook 'verilog-mode-hook	'turn-on-font-lock t)

;--------------------------------------------------------------------------------
; Auto-complete

(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-modes '(verilog-mode cperl-mode))


;--------------------------------------------------------------------------------
; ASCIIDOC

(autoload 'adoc-mode "adoc-mode" "ADOC Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.adoc$"                . adoc-mode)
                )
              auto-mode-alist))

(add-hook 'adoc-mode-hook
          (function (lambda ()
                      (set-face-attribute 'markup-list-face nil :inherit markup-meta-face :foreground "plum1")
                      (set-face-attribute 'markup-meta-face nil :foreground "gray70")
                      (set-face-attribute 'markup-meta-hide-face nil :foreground "gray70" :height 1.0)
                      (set-face-attribute 'markup-table-cell-face nil :inherit markup-table-face :background "MistyRose4")
                      (set-face-attribute 'markup-table-face nil :inherit markup-meta-face :background "black" :foreground "moccasin")
                      (set-face-attribute 'markup-title-0-face nil :height 1.0)
                      (set-face-attribute 'markup-title-1-face nil :height 1.0)
                      (set-face-attribute 'markup-title-2-face nil :height 1.0)
                      (set-face-attribute 'markup-title-3-face nil :height 1.0)
                      (set-face-attribute 'markup-title-4-face nil :height 1.0)
                      (set-face-attribute 'markup-title-5-face nil :height 1.0)
                      )))

;--------------------------------------------------------------------------------
; TaskJuggler

;(require 'taskjuggler-mode)
(autoload 'taskjuggler-mode "~/.emacs.d/prog-modes/taskjuggler-mode" "TaskJuggler Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.tjp$"               . taskjuggler-mode)
                ("\\.tji$"               . taskjuggler-mode)
                )
              auto-mode-alist))

;--------------------------------------------------------------------------------
; Text Mode

(add-hook 'text-mode-hook
	  (function (lambda ()
		      (setq tab-stop-list '(4 8 12 16 20 24 32 40 48 56 64 72 80 88 112))
		      (auto-fill-mode)
		      (setq fill-column 76)
		      (local-set-key "\C-f" 'fill-paragraph)
;		      (local-set-key "\C-m" 'newline-and-indent)
		      )))

;--------------------------------------------------------------------------------
; sh Mode

(autoload 'sh-mode "sh-script" "Shell mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.f$"                . sh-mode)
                )
              auto-mode-alist))

(add-hook 'sh-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-c\C-c" 'comment-region)
		      )))

;--------------------------------------------------------------------------------
; Ksh Mode

(autoload 'ksh-mode "ksh-mode" "KSH mode" t)

(add-hook 'ksh-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-c\C-c" 'comment-region)
		      )))

;--------------------------------------------------------------------------------
; Emacs Lisp Mode

(add-hook 'emacs-lisp-mode-hook
	  (function (lambda ()
		      (local-set-key "\C-c\C-c" 'comment-region)
		      )))

;--------------------------------------------------------------------------------
; Perl Mode

(autoload 'cperl-mode "cperl-mode" "Perl mode" t)

(setq interpreter-mode-alist
	(append (list 
		(cons "perl" 'cperl-mode)
		) interpreter-mode-alist))

(add-hook 'cperl-mode-hook
	  (function (lambda ()
	              (setq cperl-auto-newline nil)
		      (setq cperl-indent-level 2)
		      (setq cperl-tab-always-indent nil)
		      (setq cperl-tab-to-comment t)
		      (local-set-key "\C-c\C-c" 'comment-region)
		      (local-set-key '[(meta backspace)] 'backward-kill-word)
		      (set-face-font 'cperl-hash-face my-font)
		      )))

(add-hook 'perl-mode-hook
	  (function (lambda ()
	              (setq cperl-auto-newline nil)
		      (setq perl-indent-level 2)
		      (setq perl-tab-always-indent nil)
		      (setq perl-tab-to-comment t)
		      (local-set-key "\C-c\C-c" 'comment-region)
		      (local-set-key '[(meta backspace)] 'backward-kill-word)
		      )))

;--------------------------------------------------------------------------------
; Specman e Mode

;(setq auto-mode-alist
;      (append '(("\\.e$" . e-mode)
;		) auto-mode-alist))

;(autoload 'e-mode  "e-mode" "Specman e mode" t)

;(add-hook 'e-mode-hook		'turn-on-font-lock t)

(setq auto-mode-alist 
	  (append (list 
		   (cons "\\.e\\'"    'specman-mode)
		   (cons "\\.e3\\'"   'specman-mode)
		   (cons "\\.load\\'" 'specman-mode)
		   (cons "\\.ecom\\'" 'specman-mode)
		   (cons "\\.etst\\'" 'specman-mode))
		  auto-mode-alist))

(autoload 'specman-mode "sn_emacs" "Specman" t)
  
(add-hook 'specman-mode-hook 'turn-on-font-lock t)


;--------------------------------------------------------------------------------
; Makefiles

(autoload 'makefile-mode "make-mode" "Makefile mode" t)

(setq auto-mode-alist
      (append '(("Makefile$"		. makefile-mode)
		("makefile$"		. makefile-mode)
		) auto-mode-alist))

;--------------------------------------------------------------------------------
; Info mode

(add-hook 'Info-mode-hook      
	  '(lambda () 
	     (set-face-foreground 'info-node "yellow")
	     (set-face-foreground 'info-xref "green")
	     (set-face-font 'info-node my-font)
	     (set-face-font 'info-xref my-font)
	     (setq Info-default-directory-list
		   (append Info-default-directory-list 
			   '("~/share/info")))
	     )
	  )

;--------------------------------------------------------------------------------
; Vector File Mode

(defun vector-file-mode ()
  "Vector File Mode"
  (interactive)
  (setq truncate-lines t)
)

(setq auto-mode-alist
      (append '(("\\.trc$" . vector-file-mode)
		("\\.crf$" . vector-file-mode)
		("\\.vrf$" . vector-file-mode)
		("\\.vec$" . vector-file-mode)
		) auto-mode-alist))

;--------------------------------------------------------------------------------
; HTML

(setq auto-mode-alist
      (append '(("\\.html$" . fundamental-mode)
	       ) auto-mode-alist))

;********************************************************************************

;***********************
; C-MODE
;***********************

; C Mode (use the much better one)
(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode   "cc-mode" "C Editing Mode" t)

(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
		("\\.cc$" . c++-mode)
		("\\.hh$" . c++-mode)
		("\\.c$"  . c++-mode)
		("\\.h$"  . c++-mode)
		)
              auto-mode-alist))

(defconst c++-font-lock-keywords (list
 		; keywords
	(list (concat "\\<\\("
		      "break\\|case\\|catch\\|cin\\|continue\\|cout\\|default\\|delete\\|"
		      "do\\|else\\|for\\|goto\\|if\\|new\\|private\\|protected\\|public\\|"
		      "return\\|struct\\|switch\\|try\\|typedef\\|while"
		      "\\)\\>")
	      '(1 font-lock-keyword-face nil t))
		; functions
	'("\\([a-zA-Z0-9_$]+\\)\\s *(" 1 font-lock-function-name-face nil)
		; types
	(list (concat "\\<\\(char\\|class\\|const\\|double\\|enum\\|extern\\|"
		      "FILE\\|float\\|inline\\|int\\|long\\|register\\|short\\|static\\|"
		      "unsigned\\|void\\|volatile\\)\\>")
		'(1 font-lock-type-face nil))
		; numbers
	'("\\<\\(\\(\\(0x\\|&\\)[0-9A-Fa-f]+\\)\\|[0-9]+\\)\\>" 0 font-lock-variable-name-face nil)
		; symbols
	'("\\<\\(NULL\\|stderr\\|stdout\\|stdin\\)\\>" 1 font-lock-variable-name-face nil)
		; preprocessor
	(list "^\\s *\\(#\\sw+\\)" '(1 font-lock-preprocessor-face nil))
	(list "^\\s *#.*<\\([^>]+\\)>" '(1 font-lock-string-face nil))
		; operators
	'("+\\|-\\|=\\|*\\|/\\|<\\|>\\|&\\||\\|!\\|:\\|\\." 0 font-lock-keyword-face nil)
    ) "Additional expressions to highlight in C++ mode.")

(add-hook 'c++-mode-hook
	 (function (lambda ()
		     (setq c++-basic-offset 2) 	; basic offset for indentation
		     (setq c++-tab-always-indent nil) 	; nil: indents if left margin otherwise insert tab
		     )))


(defun abs-c-hook ()
  (local-set-key [return] 'newline-and-indent)
  (local-set-key [(control j)] 'newline)
)

(add-hook 'c-mode-hook 'abs-c-hook)
(add-hook 'c-mode-hook 'turn-on-font-lock t)

;***********************
; SYNOPSYS SCR
;***********************

;;; Turn on c-mode for Synopsys command files - assumed to be *.scr or *.cmd
(autoload 'c-mode "c-mode" "C Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.cmd$"              . c-mode)
                ("\\.scr$"              . c-mode)
                )
              auto-mode-alist))


;***********************
; VERILOG MODE
;***********************

; regexp-opt required for verilog mode
(require 'regexp-opt)
(autoload 'verilog-mode "~/.emacs.d/prog-modes/verilog-mode" "Verilog Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.v$"                . verilog-mode)
                ("\\.sv$"               . verilog-mode)
                ("\\.sva$"              . verilog-mode)
                )
              auto-mode-alist))
 
;; Now hook the modes in, as appropriate
(add-hook 'verilog-mode-hook
	  (function (lambda ()
		      (local-set-key '[(meta backspace)] 'backward-kill-word)
		      (local-set-key "\C-c\C-c" 'comment-region)
		      )))

(add-hook 'verilog-mode-hook 'turn-on-font-lock t
          (setq verilog-indent-level                2
                verilog-indent-level-module         2
                verilog-indent-level-declaration    2
                verilog-indent-level-behavioral     2
                verilog-indent-level-directive      2
                verilog-case-indent                 2
                verilog-auto-newline                nil
                verilog-auto-indent-on-newline      t
                verilog-tab-always-indent           nil
                verilog-auto-endcomments            t
                verilog-minimum-comment-distance    40
                verilog-indent-begin-after-if       t
                verilog-highlight-grouping-keywords t
                verilog-highlight-p1800-keywords    t
                verilog-auto-lineup                 '(quote all)
                )
)

;(custom-set-faces '(verilog-font-lock-p1800-face ((((class color) (background dark)) (:foreground "hotpink" :weight bold)))))
;(set-face-foreground 'verilog-font-lock-p1800-face "hotpink")

(add-hook 'verilog-mode-hook (lambda () 
                               (set-face-foreground verilog-font-lock-p1800-face "hotpink")
                               (set-face-foreground verilog-font-lock-ams-face "cyan")
                               (set-face-font verilog-font-lock-ams-face my-font)
                               ))


;***********************
; VHDL MODE
;***********************

(autoload 'vhdl-mode "~/.emacs.d/prog-modes/vhdl-mode-3.33.17/vhdl-mode" "VHDL Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.vhdl?\\'" . vhdl-mode)
                )
              auto-mode-alist))


;***********************
; MATLAB MODE
;***********************

(autoload 'matlab-mode "~/.emacs.d/prog-modes/matlab" "Matlab Mode" t)
(setq auto-mode-alist
      (append '(
                ("\\.m?\\'" . matlab-mode)
                )
              auto-mode-alist))


;***********************
; PYTHON MODE
;***********************

;(autoload 'python-mode "~/.emacs.d/prog-modes/python-mode.el-6.1.3/python-mode" "Python Mode" t)
;(setq auto-mode-alist
;      (append '(
;                ("\\.py?\\'" . python-mode)
;                )
;              auto-mode-alist))

(autoload 'python-mode "~/.emacs.d/prog-modes/python-mode.el-6.1.3/python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))


;***********************
; ASSEMBLER MODE
;***********************

(autoload 'armasm-mode "asm-mode" "Assembler Mode" t)
(setq auto-mode-alist (append '(
				("\\.hs\\'" . asm-mode) 
				("\\.s\\'" . asm-mode) 
				)
			      auto-mode-alist))

; Note: The following is for ARM assembler.
;       Uncomment if working on ARM assembler code

;(autoload 'armasm-mode "armasm-mode" "ARM Assembler Mode" t)
;(setq auto-mode-alist (append '(
;				("\\.hs\\'" . armasm-mode) 
;				("\\.s\\'" . armasm-mode) 
;				)
;			      auto-mode-alist))

;(defun abs-armasm-hook ()
;  (setq tab-stop-list '(16 24 40 48 56 64 72 80 88 112))
;  (setq indent-tabs-mode nil)
;)

;(add-hook 'armasm-mode-hook 'abs-armasm-hook)


;***********************
; C-PERL MODE
;***********************

(setq auto-mode-alist (append '(
				("\\.pl\\'" . cperl-mode) 
				("\\.pm\\'" . cperl-mode) 
				)
			      auto-mode-alist))

(autoload 'cperl-mode "cperl-mode" "CPerl Mode" t)

(defun abs-cperl-hook ()
  (local-set-key [return] 'newline-and-indent)
  (local-unset-key [(control h) f])
  (local-set-key [(control c) (control f)] 'cperl-info-on-command)
  (local-unset-key [(control h) v])
  (local-set-key [(control c) (control v)] 'cperl-get-help)
  (local-set-key [(meta q)] 'cperl-fill-paragraph)
  (auto-fill-mode)
  (local-set-key [(control c) (meta q)] 'cperl-indent-region)
)
(add-hook 'cperl-mode-hook 'abs-cperl-hook)

;***********************
; SPECMAN MODE
;***********************

(autoload 'specman-mode "specman-mode" "Specman mode" t )
;; Any files that end in .e, .e3, et cetera should be in specman mode
(setq auto-mode-alist
      (append (list
               (cons "\\.e\\'" 'specman-mode)
               (cons "\\.e3\\'" 'specman-mode)
               (cons "\\.load\\'" 'specman-mode)
               (cons "\\.ecom\\'" 'specman-mode)
               (cons "\\.etst\\'" 'specman-mode))
               auto-mode-alist))
(add-hook 'specman-mode-hook 'turn-on-font-lock t)

;***********************
; TCL MODE
;***********************

;(autoload 'tcl-mode "~/.emacs.d/prog-modes/tcl" "TCL mode" t )
(autoload 'tcl-mode "tcl" "TCL mode" t )
(setq auto-mode-alist
      (append '(
                ("\\.tcl$"                . tcl-mode)
                ("\\.sdc$"                . tcl-mode)
                )
              auto-mode-alist
              ))
(add-hook 'tcl-mode-hook 'turn-on-font-lock t)

;***********************
; Shell Script MODE
;***********************

(setq auto-mode-alist
      (append '(
                ("\\.tests$"              . sh-mode)
                )
              auto-mode-alist
              ))
(add-hook 'sh-mode-hook 'turn-on-font-lock t)

;***********************
; HTML MODE
;***********************

(setq auto-mode-alist
      (append '(
                ("\\.html$"              . html-mode)
                ("\\.htm$"              . html-mode)
                )
              auto-mode-alist
              ))
(add-hook 'html-mode-hook 'turn-on-font-lock t)

;***********************
; HTML HELPER MODE
;***********************

(autoload 'html-helper-mode "html-helper-mode" "HTML Helper Mode" t)

(add-hook 'html-helper-mode-hook 'turn-on-font-lock t)

;***********************
; FOLDING MODE
;***********************

(load "~/.emacs.d/config/folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
(folding-add-to-marks-list 'verilog-mode "// {{{ " "// }}}")
(folding-add-to-marks-list 'specman-mode "// {{{ " "// }}}")
(folding-add-to-marks-list 'vhdl-mode    "-- {{{ " "-- }}}")
(folding-add-to-marks-list 'python-mode  "# {{{ " "# }}}")
(folding-add-to-marks-list 'tcl-mode  "# {{{ " "# }}}")
(folding-add-to-marks-list 'taskjuggler-mode  "# {{{ " "# }}}")
(if (load "~/.emacs.d/config/folding" 'nomessage 'noerror)
    (folding-mode-add-find-file-hook))
(autoload 'folding-mode          "~/.emacs.d/config/folding" "Folding mode" t)
(autoload 'turn-off-folding-mode "~/.emacs.d/config/folding" "Folding mode" t)
(autoload 'turn-on-folding-mode  "~/.emacs.d/config/folding" "Folding mode" t) 




(provide 'config-modes)

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; colors.el --- Custom color setup. Use the 'charcoal-black'
;;; theme from color-themes, but change some colors to make it more
;;; readable when programming.

;; color-theme dir
(add-to-list 'load-path "~/.emacs.d/packages/color-theme-6.6.0")

;; Add color-theme support
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

;; More distinct colors for programming
(set-face-foreground font-lock-comment-face "green")
(set-face-italic-p font-lock-comment-face t)
(set-face-foreground font-lock-constant-face "tomato1")
(set-face-foreground font-lock-doc-face "MediumOrchid1")
(set-face-foreground font-lock-function-name-face "yellow")
(set-face-foreground font-lock-keyword-face "cyan")
(set-face-foreground font-lock-reference-face "salmon1")
(set-face-foreground font-lock-string-face "magenta")
(set-face-foreground font-lock-builtin-face "chocolate")
(set-face-foreground font-lock-variable-name-face "orange red")

;; Some lisp-specific regexp colors.
(font-lock-add-keywords 'lisp-mode
                       '(("(\\(\\(define-\\|def\\|do-\\|with-\\|set\\|get\\|make-\\|and\\|or\\|not\\|null\\)\\(\\s_\\|\\w\\)*\\)"
                          1 font-lock-keyword-face)))

(font-lock-add-keywords 'lisp-mode
                        '(("\\(\\+[a-zA-Z0-9\\-]+\\+\\)" 1 font-lock-constant-face)))

(font-lock-add-keywords 'lisp-mode
                        '(("\\(\\*[a-zA-Z0-9\\-]+\\*\\)" 1 font-lock-variable-name-face)))

(provide 'colors)

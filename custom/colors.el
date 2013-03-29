;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; colors.el --- Custom color setup. I'm using a solarized
;;; dark color, with some extra customizations for lisp code.
;;; Note that this requires the built-in theme support from
;;; emacs 24+

(el-get 'sync 'color-theme-solarized)

(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/color-theme-solarized")
(load-theme 'solarized-dark t)

;; Some lisp-specific regexp colors.
(font-lock-add-keywords 'lisp-mode
                       '(("(\\(\\(define-\\|def\\|do-\\|with-\\|set\\|get\\|make-\\|and\\|or\\|not\\|null\\)\\(\\s_\\|\\w\\)*\\)"
                          1 font-lock-keyword-face)))

(font-lock-add-keywords 'lisp-mode
                        '(("\\(\\+[a-zA-Z0-9\\-]+\\+\\)" 1 font-lock-constant-face)))

(font-lock-add-keywords 'lisp-mode
                        '(("\\(\\*[a-zA-Z0-9\\-]+\\*\\)" 1 font-lock-variable-name-face)))

(provide 'colors)

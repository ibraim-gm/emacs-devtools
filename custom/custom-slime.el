;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; custom-slime.el --- Custom setup for SLIME. Basically, uses the
;;; slime provided by quicklisp (http://www.quicklisp.org) and enable
;;; auto-complete and automatic indenting.
;;; Note the function 'enable-common-lisp-slime', that is needed to
;;; separate the quicklisp version of slime from the clojure version.

;; Change to the correct location of quicklisp-slime-helper
(defconst quicklisp-slime-helper-location "~/.quicklisp/slime-helper.el")
(el-get 'sync 'ac-slime)

;; Shortcut to start slime
(add-hook 'lisp-mode-hook
          (lambda ()
            (interactive)
            (define-key lisp-mode-map [f5] 'slime)))

;; Make sure auto-complete is working on the repl
(add-hook 'slime-repl-mode-hook
          (lambda ()
            (interactive)
            (slime-mode)
            (set-up-slime-ac)))

;; Enhance slime-mode a little bit
(add-hook 'slime-mode-hook
          (lambda ()
            (define-key slime-mode-map (kbd "\r") 'newline-and-indent)
            (set-up-slime-ac)))

;; Enable slime support for common lisp.
;; this should be called inside the language file that intends to use
;; que version of slime provided by quicklisp
(defun enable-common-lisp-slime ()
  (interactive)
  (load (expand-file-name quicklisp-slime-helper-location))
  (require 'slime)
  (setq slime-net-coding-system 'utf-8-unix)
  (slime-setup '(slime-fancy slime-asdf)))

(provide 'custom-slime)

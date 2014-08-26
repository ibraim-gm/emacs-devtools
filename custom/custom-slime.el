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

;; make sure paredit is available
(install-if-needed 'paredit)

(defun change-paredit-bindings ()
  (interactive)
  (define-key paredit-mode-map (kbd "C-<right>") 'right-word)
  (define-key paredit-mode-map (kbd "C-<left>") 'left-word)
  (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "M-<left>") 'paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-M-<right>") 'paredit-forward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-M-<left>") 'paredit-backward-barf-sexp))

;; Shortcut to start slime
(add-hook 'lisp-mode-hook
          (lambda ()
            (interactive)
            (define-key lisp-mode-map [f5] 'slime)
            (paredit-mode)
            (change-paredit-bindings)))

;; Make sure auto-complete is working on the repl
(add-hook 'slime-repl-mode-hook
          (lambda ()
            (interactive)
            (slime-mode)
            (install-if-needed 'ac-slime)
            (set-up-slime-ac)))

;; Enhance slime-mode a little bit
(add-hook 'slime-mode-hook
          (lambda ()
            (define-key slime-mode-map (kbd "\r") 'newline-and-indent)
            (install-if-needed 'ac-slime)
            (set-up-slime-ac)
            (paredit-mode 1)
            (change-paredit-bindings)))

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

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; ac.el --- Auto-complete custom configuration and setup

;; auto-complete dir
(add-to-list 'load-path "~/.emacs.d/packages/auto-complete-1.3.1")

;; Require & configure
(require 'auto-complete-config)
(require 'ac-slime)

(add-to-list 'ac-dictionary-directories
             (expand-file-name "~/.emacs.d/packages/auto-complete-1.3.1/ac-dict"))
(ac-config-default)

;; Enable auto-complete for slime, lisp and clojure
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'clojure-mode)

;; Since our color-theme is dark, we need to use more adequate colors
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

(provide 'ac)

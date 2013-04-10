;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; ac.el --- Auto-complete custom configuration and setup

;; install and initialization
(el-get 'sync 'auto-complete-mode)
(ac-config-default)

;; enable for the following modes
(add-to-list 'ac-modes 'slime-repl-mode)
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'clojure-mode)
(add-to-list 'ac-modes 'java-plus-mode)
(add-to-list 'ac-modes 'android-mode)
(add-to-list 'ac-modes 'ant-mode)

;; ;; Since our color-theme is dark, we need to use more adequate colors
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

(provide 'ac)

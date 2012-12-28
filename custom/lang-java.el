;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-java.el --- Editing options for Java

;; source directory
(add-to-list 'load-path "~/.emacs.d/packages/emacs-java")

;; require
(require 'java-mode-plus)
(require 'java-docs)

(add-hook 'java-mode-hook
          (lambda ()
            (define-key java-mode-map (kbd "\r") 'newline-and-indent)))

(provide 'lang-java)

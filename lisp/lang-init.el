;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-init.el --- Languague-specific initialization

;;;###autoload
(defun lang/init ()
  "Initialize language-specific configuration"
  (lang-markdown-init))

(defun lang-markdown-init ()
  (eval-after-load "markdown-mode"
    '(progn
       (define-key markdown-mode-map (kbd "C-c C-c t") 'markdown-toc-generate-toc))))

(provide 'lang-init)

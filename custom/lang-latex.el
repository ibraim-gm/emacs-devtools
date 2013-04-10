;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-latex.el --- Load and configure AUCTex to use pdflatex
;;; by default and to use auto-fill in latex documents.

(el-get 'sync 'auctex)

(add-hook 'LaTeX-mode-hook
          '(lambda ()
            (interactive)
            (turn-on-auto-fill)
            (tex-pdf-mode t)))

(provide 'lang-latex)

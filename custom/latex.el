;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; latex.el --- Load and configure AUCTex to use pdflatex
;;; by default and to use auto-fill in latex documents.

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(provide 'latex)

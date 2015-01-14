;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2015 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-autoit.el --- AutoIt3 language support

;; install and initialization
(add-to-list 'load-path "~/.emacs.d/modules/autoit-mode")
(require 'autoit-mode)
(add-to-list 'auto-mode-alist '("\.au3$" . autoit-mode))

(provide 'lang-autoit)

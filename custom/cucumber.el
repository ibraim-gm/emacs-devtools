;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; cucumber.el --- Load Michael Klishin's cucumber.el package

(add-to-list 'load-path "~/.emacs.d/packages/cucumber.el")
(setq feature-default-i18n-file "~/.emacs.d/packages/cucumber.el/i18n.json")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'cucumber)

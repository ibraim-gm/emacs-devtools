;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-cucumber.el --- Allow editing of cucumber files

(install-if-needed 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'lang-cucumber)

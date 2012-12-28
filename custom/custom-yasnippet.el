;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; custom-yasnippet.el --- Yasnippet support

;; auto-complete dir
(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")

;; Require & configure
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/packages/yasnippet/snippets"
        "~/.emacs.d/packages/cucumber.el/snippets"
        "~/.emacs.d/packages/emacs-java/snippets"))

(yas-global-mode 1)

(provide 'custom-yasnippet)

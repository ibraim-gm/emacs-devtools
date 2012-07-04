;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-clojure.el --- Setup clojure support. Use the awesome
;;; clojure-mode and remap some keys to more sane values.

;; We need the awesome clojure-mode of Phil Hagelberg
(require 'clojure-mode)

;; Shortcut for starting a clojure process
(global-set-key [f5] 'clojure-jack-in)

;; Rebind some keys to more sane values and enable test mode
(add-hook 'slime-mode-hook
          (lambda ()
            (interactive)
            (define-key slime-mode-map (kbd "C-c C-c") 'slime-eval-defun)
            (define-key slime-mode-map (kbd "M-p") 'slime-repl-previous-input)
            (require 'clojure-test-mode)))

(provide 'lang-clojure)

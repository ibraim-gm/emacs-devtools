;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-php.el --- Setup php support

;; Load php support
(install-if-needed 'php-mode)

;; Add to auto-modes list
(add-to-list 'auto-mode-alist
     	     '("\\.php[345]?\\'\\|\\.phtml\\'" . php-mode))

;; Better indentation
(add-hook 'php-mode-hook
          (lambda ()
            (setq require-final-newline t)
            (define-key php-mode-map (kbd "\r") 'newline-and-indent)))

(provide 'lang-php)

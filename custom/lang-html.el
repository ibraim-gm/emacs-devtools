;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2014 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-html.el --- Editing options for html

(add-hook 'html-mode-hook
          (lambda ()
            (define-key html-mode-map (kbd "\r") 'newline-and-indent)))

(provide 'lang-html)

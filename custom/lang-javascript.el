;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2014 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-javascript.el --- Editing options for javascript

(setq js-indent-level 2)

(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "\r") 'newline-and-indent)))

(provide 'lang-javascript)

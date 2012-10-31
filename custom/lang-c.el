;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-c.el --- Editing options for C

(setq c-default-style "linux"
      c-basic-offset 2)

(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map (kbd "\r") 'newline-and-indent)))

(provide 'lang-c)

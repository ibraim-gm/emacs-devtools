;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-sbcl.el --- Setup SBCL support. Not much to do here,
;;; only specify SBCL as lisp program and enable the CL support
;;; specified in custom-slime.el.

(add-hook 'lisp-mode-hook
          (lambda ()
            (interactive)
            (enable-common-lisp-slime)))

(setq inferior-lisp-program "sbcl")

(provide 'lang-sbcl)

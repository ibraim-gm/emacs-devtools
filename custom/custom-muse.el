;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2014 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; custom-muse.el --- Custom setup for Emacs MUSE

;; requirements
(install-if-needed 'muse)

(require 'muse-mode)

;; load aux modules only when needed
(add-hook 'muse-mode-hook
          (lambda ()
            (require 'muse-html)
            (require 'muse-latex)
            (require 'muse-project)

            ;; default binding to export project
            (define-key muse-mode-map [f5] 'muse-project-publish)

            ;; Project definitions.
            ;; Please see the documentation at http://mwolson.org/static/doc/muse.html
            (load "~/.muse-projects")))

(provide 'custom-muse)

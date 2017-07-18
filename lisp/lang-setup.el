;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-setup.el --- First-time setup for languague-specific
;;; functionality

;;;###autoload
(defun lang/setup ()
  "Setup the values of custom configurations of specific languages"
  (lang-markdown-setup))

(defun lang-markdown-setup ()
  (customize-save-variable 'markdown-command "pandoc")
  (customize-save-variable 'markdown-command-needs-filename t))

(provide 'lang-setup)

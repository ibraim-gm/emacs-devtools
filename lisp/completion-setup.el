;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; completion-setup.el --- First-time setup of completion
;;; functionality

;;;###autoload
(defun completion/setup ()
  "Setup the values of custom confurations to make completion work"
  (customize-save-variable 'ivy-mode t)
  (customize-save-variable 'ivy-use-virtual-buffers t))

(provide 'completion-setup)

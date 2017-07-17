;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; editor-setup.el --- First-time setup of common editor
;;; variables

;;;###autoload
(defun editor/setup ()
  "Setup the values of custom confurations to make editing easier"
  (customize-save-variable 'inhibit-startup-screen t)
  (customize-save-variable 'inhibit-startup-message t)
  (customize-save-variable 'tool-bar-mode nil)
  (customize-save-variable 'scroll-bar-mode 'right)
  (customize-save-variable 'split-window-threshold nil)
  (customize-save-variable 'column-number-mode t)
  (customize-save-variable 'line-number-mode t)
  (customize-save-variable 'show-paren-mode t)
  (customize-save-variable 'show-trailing-whitespace t)
  (customize-save-variable 'transient-mark-mode t)
  (customize-save-variable 'delete-selection-mode t)
  (customize-save-variable 'truncate-lines t)
  (customize-save-variable 'global-hl-line-mode t)
  (customize-save-variable 'mouse-wheel-mode t)
  (customize-save-variable 'next-line-add-newlines nil)
  (customize-save-variable 'scroll-step 1)
  (customize-save-variable 'scroll-conservatively 10)
  (customize-save-variable 'x-underline-at-descent-line t)
  (customize-save-variable 'default-major-mode 'text-mode)
  (customize-save-variable 'query-replace-highlight t)
  (customize-save-variable 'search-highlight t)
  (customize-save-variable 'global-font-lock-mode t)
  (customize-save-variable 'fill-column 80)
  (customize-save-variable 'comment-empty-lines t)
  (customize-save-variable 'standard-indent 2)
  (customize-save-variable 'indent-tabs-mode t)
  (customize-save-variable 'require-final-newline t)
  (customize-save-variable 'backup-directory-alist (quote ((".*" . "~/.emacs.d/backup/"))))
  (customize-save-variable 'ls-lisp-dirs-first t)
  (customize-save-variable 'dired-listing-switches "-l")
  (customize-save-variable 'enable-recursive-minibuffers t)
  (customize-save-variable 'spacemacs-theme-comment-bg nil)
  (customize-save-variable 'spacemacs-theme-org-highlight nil)
  (customize-save-variable 'spacemacs-theme-comment-italic t)
  (customize-save-variable 'spacemacs-theme-org-height nil)
  (customize-save-variable 'spacemacs-theme-org-agenda-height nil)
  (require 'ediff)
  (customize-save-variable 'ediff-use-last-dir t)
  (customize-save-variable 'ediff-diff-options " -b "))

(provide 'editor-setup)

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; editor-init.el --- Setting up things not supported
;;; by CONFIGURE

(defun editor/init ()
  "Setup values that aren't supported by CONFIGURE."
  (modify-frame-parameters nil '((wait-for-wm . nil)))
  (editor-init-title)
  (editor-init-default-dir)
  (fset 'yes-or-no-p 'y-or-n-p)
  (recentf-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq-default ediff-ignore-similar-regions t)
  (editor-maximize-on-ms-windows)
  )

(defun editor-init-title ()
  (setq frame-title-format
	(list (format "%s %%S: %%j " (system-name))
	      '(buffer-file-name "%f" (dired-directory dired-directory "%b")))))

(defun editor-init-default-dir ()
  (when (= (length command-line-args) 1)
    (setq default-directory "~/")))

(defun editor-maximize-on-ms-windows ()
  (when (memq system-type '(ms-dos windows-nt))
    (w32-send-sys-command 61488)))


(provide 'editor-init)

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; editor-init.el --- Setting up things not supported
;;; by CONFIGURE

;;;###autoload
(defun editor/init ()
  "Setup values that aren't supported by CONFIGURE."
  (set-face-attribute 'default nil :font "DejaVu Sans Mono-10")
  (modify-frame-parameters nil '((wait-for-wm . nil)))
  (editor-init-title)
  (fset 'yes-or-no-p 'y-or-n-p)
  (recentf-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq-default indent-tabs-mode nil)
  (setq-default ediff-ignore-similar-regions t)
  (load-theme 'spacemacs-dark t)
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)
  (editor-maximize))

(defun editor-init-title ()
  (setq frame-title-format
	(list (format "%s %%S: %%j " (system-name))
	      '(buffer-file-name "%f" (dired-directory dired-directory "%b")))))

(defun editor-maximize ()
  (when (memq system-type '(ms-dos windows-nt))
    (w32-send-sys-command 61488))
  (when (memq system-type '(gnu gnu/linux))
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))))

(provide 'editor-init)

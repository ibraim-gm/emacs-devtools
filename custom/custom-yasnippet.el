;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; custom-yasnippet.el --- Yasnippet support

(install-if-needed 'yasnippet)

(setq yas-snippet-dirs
      '(;"~/.emacs.d/snippets"
        "~/.emacs.d/custom/snippets"))

;; Functions used by the custom snippets
(defun yas-custom-get-project ()
  (or
   (when (boundp 'project-name) (symbol-value 'project-name))
   "(Please, fill the variable project-name)"))

(defun yas-custom-get-user-name ()
  (or
   (when (boundp 'project-user-name) (symbol-value 'project-user-name))
   "(Please, fill the variable project-user-name)"))

(defun yas-custom-get-user-mail ()
  (or
   (when (boundp 'project-user-mail) (symbol-value 'project-user-mail))
   "(Please, fill the variable project-user-mail)"))

(defun yas-custom-get-release-years ()
  (or
   (when (boundp 'project-release-years) (symbol-value 'project-release-years))
   "(Please, fill the variable project-release-years)"))

;; Reload everything only once and only when needed
(defvar *yas-reloaded* nil)
(defun custom-yas-minor-mode (orig-fn &rest args)
  (unless *yas-reloaded*
    (yas-reload-all)
    (setf *yas-reloaded* t))
  (apply orig-fn args))

(advice-add 'yas-minor-mode :around #'custom-yas-minor-mode)

;; Enable only when needed
(defun custom--enable-yasnippet ()
  (interactive)
  (let ((buff (buffer-name (current-buffer))))
    (when (cond
           ((string= buff "*scratch*") nil)
           (t t))
      (yas-minor-mode 1))))

(add-hook 'prog-mode-hook #'custom--enable-yasnippet)
(add-hook 'text-mode-hook #'custom--enable-yasnippet)

(provide 'custom-yasnippet)

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; bootstrap.el --- Bootstrap emacs-devtools

(defgroup devtools nil
  "Emacs Devtools configuration"
  :group 'convenience)

(defcustom devtools-installed nil
  "When non-nil, indicates that emacs-devtools is properly installed."
  :type '(boolean)
  :group 'devtools)

(defconst devtools-src-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "lisp"))))
(defconst devtools-loaddefs-file (concat devtools-src-dir "loaddefs.el"))
(defconst devtools-recipe-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "recipes"))))

(defun devtools/bootstrap ()
  "Initialize configuration system"
  (setq custom-file "~/.emacs-custom")
  (set-default-dir)
  (install-and-configure-quelpa)
  (install-all-quelpa-packages)
  (update-all-autoloads)
  (load custom-file :noerror t)
  (load devtools-loaddefs-file)
  (add-to-list 'load-path devtools-src-dir))

(defun set-default-dir ()
  (when (= (length command-line-args) 1)
    (setq default-directory "~/")))

(defun update-all-autoloads ()
  (interactive)
  (let ((generated-autoload-file devtools-loaddefs-file))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer)))
    (update-directory-autoloads devtools-src-dir)))

(defun install-and-configure-quelpa ()
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-checkout-melpa-p nil)
  (unless (require 'quelpa nil t)
    (with-temp-buffer
      (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
      (eval-buffer))
    (require 'quelpa))
  (add-to-list 'quelpa-melpa-recipe-stores devtools-recipe-dir))

(defun install-all-quelpa-packages ()
  (quelpa 'spacemacs-theme)
  (quelpa 'async)
  (quelpa 'ivy)
  (quelpa 'ag)
  )

(provide 'devtools-bootstrap)

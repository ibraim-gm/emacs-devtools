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

(defun devtools/bootstrap ()
  "Initialize configuration system"
  (update-all-autoloads)
  (setq custom-file "~/.emacs-custom")
  (load custom-file :noerror t)
  (load devtools-loaddefs-file)
  (add-to-list 'load-path devtools-src-dir))

(defun update-all-autoloads ()
  (interactive)
  (let ((generated-autoload-file devtools-loaddefs-file))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer)))
    (update-directory-autoloads devtools-src-dir)))

(provide 'devtools-bootstrap)

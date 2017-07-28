;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; devtools-common.el --- emacs-devtools common definitions

(defconst devtools-src-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "lisp"))))
(defconst devtools-loaddefs-file (concat devtools-src-dir "loaddefs.el"))
(defconst devtools-quelpa-build-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "quelpa/build"))))

;;;###autoload
(defun devtools-update-all-autoloads ()
  "Update the autoloads of devtools."
  (interactive)
  (let ((generated-autoload-file devtools-loaddefs-file))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer)))
    (update-directory-autoloads devtools-src-dir)
    (kill-buffer "loaddefs.el"))
  (load devtools-loaddefs-file))

(provide 'devtools-common)

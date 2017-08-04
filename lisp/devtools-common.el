;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; devtools-common.el --- emacs-devtools common definitions

(defconst devtools-src-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "lisp"))))
(defconst devtools-data-dir (file-name-as-directory (expand-file-name (concat devtools-src-dir "data"))))
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

(defun devtools-create-block-region-if-none ()
  "If there is no active region, creates one. The region is created by
going up until a blank line is found, and then walking down, until a blank line
is found."
  (interactive)
  (when (not (region-active-p))
    (let ((lines-up (devtools-count-until-empty-line -1))
	  (lines-down (devtools-count-until-empty-line 1)))
      (beginning-of-line)
      (message (number-to-string lines-up))
      (message (number-to-string lines-down))
      (forward-line (- 0 lines-up))
      (set-mark-command nil)
      (forward-line (+ lines-up lines-down))
      (end-of-line))))

(defun devtools-count-until-empty-line (step)
  "Count the number of lines until the first empty line is found.
Use `1' to walnk down, and `-1' to go up."
  (save-excursion
    (devtools-count-until-empty-line-helper 0 step)))

(defun devtools-count-until-empty-line-helper (total step)
  "Helper for the function `devtools-count-until-empty-line-helper'."
  (let ((result (forward-line step)))
    (if (or (devtools-current-line-empty-p) (> result 0))
      (progn
	(forward-line (- 0 step))
	total)
      (devtools-count-until-empty-line-helper (+ total 1) step))))

(defun devtools-current-line-empty-p ()
  "Returns `t' if the current line is empty or filled with whitespace."
  (save-excursion
    (beginning-of-line)
    (looking-at "[[:space:]]*$")))

(provide 'devtools-common)

;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; dt-const.el --- emacs-devtools common definitions

(defconst dt-src-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "lisp"))))
(defconst dt-data-dir (file-name-as-directory (expand-file-name (concat dt-src-dir "data"))))
(defconst dt-loaddefs-file (concat dt-src-dir "loaddefs.el"))
(defconst dt-quelpa-build-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "quelpa/build"))))

(defun dt-update-all-autoloads ()
  "Update the autoloads of devtools."
  (interactive)
  (let ((generated-autoload-file dt-loaddefs-file))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer)))
    (update-directory-autoloads dt-src-dir)
    (kill-buffer "loaddefs.el"))
  (load dt-loaddefs-file))

(defun dt-create-block-region-if-none ()
  "If there is no active region, creates one. The region is created by
going up until a blank line is found, and then walking down, until a blank line
is found."
  (interactive)
  (when (not (region-active-p))
    (let ((lines-up (dt--count-until-empty-line -1))
	  (lines-down (dt--count-until-empty-line 1)))
      (beginning-of-line)
      (message (number-to-string lines-up))
      (message (number-to-string lines-down))
      (forward-line (- 0 lines-up))
      (set-mark-command nil)
      (forward-line (+ lines-up lines-down))
      (end-of-line))))

(defun dt--count-until-empty-line (step)
  "Count the number of lines until the first empty line is found.
Use `1' to walnk down, and `-1' to go up."
  (save-excursion
    (dt--count-until-empty-line-helper 0 step)))

(defun dt--count-until-empty-line-helper (total step)
  "Helper for the function `devtools-count-until-empty-line-helper'."
  (let ((result (forward-line step)))
    (if (or (dt--current-line-empty-p) (> result 0))
      (progn
	(forward-line (- 0 step))
	total)
      (dt--count-until-empty-line-helper (+ total 1) step))))

(defun dt--current-line-empty-p ()
  "Returns `t' if the current line is empty or filled with whitespace."
  (save-excursion
    (beginning-of-line)
    (looking-at "[[:space:]]*$")))

(provide 'dt-const)

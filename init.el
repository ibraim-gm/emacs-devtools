;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; init.el --- Initial setup

(package-initialize)
(load
 (let* ((emacs.d (file-name-as-directory user-emacs-directory))
	(lisp (file-name-as-directory "lisp"))
	(bootstrap-file (concat emacs.d lisp "bootstrap.el")))
   (expand-file-name bootstrap-file)))

;;--- Missing from 'general.el'
;; Enhancing the main aspects of the UI
;; (set-face-attribute 'default nil :font "DejaVu Sans Mono-9")

;; Make editing easier
;; (ido-mode 1)                              ; Interactive Do Things: Simply amazing
;; (ido-everywhere 1)                        ; Activate IDO everywhere we can
;; (flx-ido-mode 1)                          ; Use flx-ido search algorithm
;; (setq ido-enable-flex-matching t)         ; Enable flexible matching
;; (global-set-key (kbd "M-x") 'smex)        ; Use smex instead of regular M-x
;; (setq tags-revert-without-query 1)        ; Tags should be reloaded automatically

;; First column marker in red.
;; (defun custom-column-marker-setter (orig-fun &rest args)
;;   (set-face-background column-marker-1-face "red")
;;   (apply orig-fun args))

;; (advice-add 'column-marker-1 :around #'custom-column-marker-setter)

;; Now, for each language that you want a column marker, you should use e.g:
;; -> (add-hook 'lisp-mode-hook
;; ->           (lambda ()
;; ->             (interactive)
;; ->             (column-marker-1 80)))
;; To mark column 80 in red. This is not enabled in any language by default

;; (put 'eval-expression 'disabled nil)
;; (put 'set-goal-column 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'eval-expression 'disabled nil)
;; (put 'downcase-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)

;; (global-set-key [C-f12] 'eshell)

;;------ Actual initialization code
(devtools/bootstrap)
;(when (not devtools-installed)
(editor/setup)
(completion/setup)
  (customize-save-variable 'devtools-installed t)
;  )
;(require 'editor-init)
(editor/init)
(completion/init)

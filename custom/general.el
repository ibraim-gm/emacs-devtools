;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; general.el --- Change a whole bunch of editing options
;;; to make emacs smarter. Many of these evolved a lot during
;;; the years and was originally copied from somewhere on the
;;; internet.

;; First, install and load a bunch of required stuff.
(install-if-needed 'eshell)
(install-if-needed 'column-marker)
(require 'dired)
(require 'font-lock)
(require 'recentf)
(require 'hippie-exp)
(require 'browse-url)
(require 'comint)
(require 'ido)
(require 'eshell)
(require 'column-marker)

;; Enhancing the main aspects of the UI
(set-face-attribute 'default nil :font "DejaVu Sans Mono-9")
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(tool-bar-mode 0)
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
	    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(set-scroll-bar-mode 'right)
(setq split-width-threshold nil)

;; Make editing easier
(when (= (length command-line-args) 1)
  (setq default-directory "~/"))             ; Make sure the default directory is home
(column-number-mode t)                    ; Its always useful to know where you are in a file.
(line-number-mode t)                      ; Same as above.
(show-paren-mode t)                       ; No one like to count closing parenthesis.
(setq-default show-trailing-whitespace t) ; Since trailing whitespace is evil, this makes easy to hunt them!
(transient-mark-mode t)                   ; Highlight mark
(setq truncate-lines t)                   ; Allow lines to be truncated on display
(global-hl-line-mode t)                   ; Highlight the current line
(mouse-wheel-mode t)                      ; Allow the mouse wheel to work
(setq next-line-add-newlines nil)         ; The name says it all...
(setq scroll-step 1)                      ; Scroll for only one line
(setq scroll-conservatively 10)           ; Size of conservative scroll
(setq default-major-mode 'text-mode)      ; By default, we are in text mode
(defconst query-replace-highlight t)      ; Highlight during query
(defconst search-highlight t)             ; Highlight incremental search
(global-font-lock-mode t)                 ; Colorize all buffers
(fset 'yes-or-no-p 'y-or-n-p)             ; Replace y-e-s by y
(recentf-mode 1)                          ; Recently edited files in menu
(setq fill-column 80)                     ; We fill by 80 columns, when enabled.
(ido-mode 1)                              ; Interactive Do Things: Simply amazing

;; I indent with 2 spaces by default. No tabs allowed.
(setq-default standard-indent 2)
(setq-default indent-tabs-mode nil)

;; Let's fix the whitespace issues: Remove every trailing whitespace on save
;; and automatically add a trailing new line when a file is saved.
(setq-default require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Column marker in red.
;; Now, for each language that you want a column marker, you should use e.g:
;; -> (add-hook 'lisp-mode-hook
;; ->           (lambda ()
;; ->             (interactive)
;; ->             (column-marker-1 80)))
;; To mark column 80 in red. This is not enabled in any language by default
(set-face-background column-marker-1-face "red")

;; I really hate my system littered with backup files.
;; Let them sit on a standard location
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup/"))))
(defconst use-backup-dir t)

;; Make dired a bit better
(setq ls-lisp-dirs-first t)
(setq dired-listing-switches "-l")

;; Enable some useful commands
(put 'eval-expression 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq enable-recursive-minibuffers t)

;; Spawn eshell when C-f12 is pressed. If you press it again, you
;; will switch to the buffer.
(global-set-key [C-f12] 'eshell)

;; Ediff
(defconst ediff-ignore-similar-regions t)
(defconst ediff-use-last-dir t)
(defconst ediff-diff-options " -b ")

;; Auto-indent elisp code
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (define-key emacs-lisp-mode-map (kbd "\r") 'newline-and-indent)))

;; On Windows, start maximized
(when (memq system-type '(ms-dos windows-nt))
  (w32-send-sys-command 61488))

(provide 'general)

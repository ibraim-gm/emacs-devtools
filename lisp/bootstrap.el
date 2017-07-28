;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; bootstrap.el --- Bootstrap emacs-devtools setup

(defconst devtools-src-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "lisp"))))
(defconst devtools-loaddefs-file (concat devtools-src-dir "loaddefs.el"))
(defconst devtools-quelpa-build-dir (file-name-as-directory (expand-file-name (concat user-emacs-directory "quelpa/build"))))

(defun devtools/bootstrap ()
  "Initialize configuration system"
  (setq custom-file "~/.emacs-custom")
  (install-and-configure-quelpa)
  (install-all-quelpa-packages)
  (update-all-autoloads)
  (load custom-file :noerror t)
  (load devtools-loaddefs-file)
  (add-to-list 'load-path devtools-src-dir))

(defun update-all-autoloads ()
  (interactive)
  (let ((generated-autoload-file devtools-loaddefs-file))
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer))
      (update-directory-autoloads devtools-src-dir)
      (kill-buffer "loaddefs.el"))))

(defun install-and-configure-quelpa ()
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-stable-p t)
  (unless (require 'quelpa nil t)
    (with-temp-buffer
      (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
      (eval-buffer))
    (require 'quelpa)))

(defun install-all-quelpa-packages ()
  (quelpa 'spacemacs-theme)
  (quelpa 'async)
  (quelpa 'ivy)
  (quelpa 'flx)
  (quelpa 'ag)
  (quelpa 'dumb-jump)
  (quelpa 'auto-complete)
  (quelpa 'projectile)
  (quelpa 'counsel-projectile)
  (quelpa 'project-explorer)
  (quelpa 'magit)
  (quelpa '(cheatsheet :repo "darksmile/cheatsheet" :fetcher github :commit "e4f8e0110167ea16a17a74517d1f10cb7ff805b8") :stable nil)
  (quelpa 'which-key)
  (quelpa 'web-mode)
  (quelpa 'smartparens)
  (quelpa 'markdown-mode)
  (quelpa 'markdown-toc))

(defun generate-dot-emacs ()
  (with-current-buffer (find-file-noselect (expand-file-name "~/.emacs"))
    (insert ";; Auto generated file from emacs-devtools")(newline)
    (newline)
    (insert "(setq gc-cons-threshold 100000000)")(newline)
    (newline)
    (insert "(let ((file-name-handler-alist nil))")(newline)
    (insert "  (setq package-enable-at-startup nil)")(newline)
    (insert "  (package-initialize)")(newline)
    (newline)
    (insert "  (defconst devtools-src-dir \"" devtools-src-dir "\")")(newline)
    (insert "  (defconst devtools-loaddefs-file \"" devtools-loaddefs-file "\")")(newline)
    (newline)
    (insert "  (setq custom-file \"~/.emacs-custom\")")(newline)
    (insert "  (when (= (length command-line-args) 1)")(newline)
    (insert "    (setq default-directory \"~/\"))")(newline)
    (insert "  (load custom-file :noerror t)")(newline)
    (insert "  (load devtools-loaddefs-file)")(newline)
    (insert "  (add-to-list 'load-path devtools-src-dir)")(newline)
    (newline)
    (insert "  (editor/init)")(newline)
    (insert "  (completion/init)")(newline)
    (insert "  (lang/init)")(newline)
    (newline)
    (insert "  (run-with-idle-timer")(newline)
    (insert "   5 nil")(newline)
    (insert "   (lambda ()")(newline)
    (insert "     (setq gc-cons-threshold 800000))))")(newline)
    (save-buffer))
  (kill-buffer ".emacs"))

(provide 'devtools-bootstrap)

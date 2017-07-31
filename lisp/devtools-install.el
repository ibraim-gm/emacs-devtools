;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; devtools-install.el --- emacs-devtools setup helpers

(require 'devtools-common)

;;;###autoload
(defun devtools-install ()
  "Install and configure emacs-devtools."
  (interactive)
  (setq custom-file "~/.emacs-custom")
  (devtools-update-all-autoloads)
  (devtools-install-packages)
  (devtools-save-custom-values)
  (devtools-generate-dot-emacs))

;;;###autoload
(defun devtools-install-packages ()
  "Install any missing packages."
  (interactive)
  (install-and-configure-quelpa)
  (install-all-quelpa-packages))

;;;###autoload
(defun devtools-generate-dot-emacs ()
  "Creates a .emacs file with devtools inititalization code."
  (interactive)
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

(defun install-and-configure-quelpa ()
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-stable-p t)
  (unless (require 'quelpa nil t)
    (with-temp-buffer
      (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
      (eval-buffer))
    (require 'quelpa)))

(defun install-all-quelpa-packages ()
  (quelpa '(spacemacs-theme :repo "nashamri/spacemacs-theme" :fetcher github :commit "b26162e8974c532b3241a43c8f194a340636e9ea" :stable nil))
  (quelpa 'async)
  (quelpa 'ivy)
  (quelpa 'flx)
  (quelpa 'ag)
  (quelpa 'dumb-jump)
  (quelpa 'auto-complete)
  (quelpa 'projectile)
  (quelpa '(counsel-projectile :repo "ericdanan/counsel-projectile" :fetcher github :commit "aefd25c74718e66f180127c0d273eade887325b0" :stable nil))
  (quelpa 'project-explorer)
  (quelpa 'magit)
  (quelpa '(cheatsheet :repo "darksmile/cheatsheet" :fetcher github :commit "e4f8e0110167ea16a17a74517d1f10cb7ff805b8") :stable nil)
  (quelpa 'which-key)
  (quelpa 'web-mode)
  (quelpa 'smartparens)
  (quelpa 'rainbow-delimiters)
  (quelpa 'feature-mode)
  (quelpa 'markdown-mode)
  (quelpa 'markdown-toc))

(provide 'devtools-install)

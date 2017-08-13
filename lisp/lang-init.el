;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-init.el --- Languague-specific initialization

;;;###autoload
(defun dt-lang-init ()
  "Initialize language-specific configuration"
  (lang-smartparens-init)
  (lang-flycheck)
  (lang-rainbow-delimiters)
  (lang-purpose)
  (lang-python-init)
  (lang-cucumber-init)
  (lang-web-init)
  (lang-markdown-init))

(defun lang-smartparens-init ()
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (add-hook 'web-mode-hook 'smartparens-mode)
  (sp-local-pair 'web-mode "{" nil :post-handlers '(:add curly-braces-on-enter) :when '(("RET"))))

(defun curly-braces-on-enter (id action context)
  (when (eq action 'insert)
    (newline)
    (indent-according-to-mode)
    (previous-line)
    (indent-according-to-mode)))

(defun lang-flycheck ()
  (eval-after-load "flycheck"
    '(progn
       (flycheck-add-mode 'javascript-eslint 'web-mode)
       (when (memq system-type '(ms-dos windows-nt))
	 (setq flycheck-xml-parser 'flycheck-parse-xml-region))))
  (global-flycheck-mode))

(defun lang-rainbow-delimiters ()
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'web-mode-hook 'rainbow-delimiters-mode))

(defun lang-purpose ()
  (eval-after-load "window-purpose"
    '(progn
       (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
       (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
       (purpose-compile-user-configuration)
       (define-key purpose-mode-map (kbd "C-x b") 'ivy-switch-buffer))))

(defun lang-python-init ()
  (global-set-key (kbd "C-x p") 'dt-pyvenv-workon)
  (eval-after-load "python"
    '(progn
       (define-key python-mode-map (kbd "<f5>") 'run-python)
       (define-key python-mode-map (kbd "C-c C-c") 'dt-python-shell-send-block)))
  (eval-after-load "pyvenv"
    '(progn
       (setenv "WORKON_HOME" "~/dev/envs"))))

(defun dt-pyvenv-workon ()
  (interactive)
   (when (not pyvenv-mode)
     (pyvenv-mode))
   (call-interactively 'pyvenv-workon))

(defun dt-python-shell-send-block ()
  "Select a block of python code and send it to the interpreter."
  (interactive)
  (save-excursion
  (dt-create-block-region-if-none)
  (call-interactively 'python-shell-send-region)
  (deactivate-mark)))

(defun lang-cucumber-init ()
  (setq feature-default-i18n-file (concat dt-data-dir "i18n.yml"))
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(defun lang-web-init ()
  (add-hook 'web-mode-hook 'dt-web-mode-hook)
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (eval-after-load "web-mode"
    '(progn
       (setq web-mode-content-types-alist
	     '(("jsx" . "\\.js[x]?\\'"))))))

(defun dt-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t))

(defun lang-markdown-init ()
  (eval-after-load "markdown-mode"
    '(progn
       (define-key markdown-mode-map (kbd "C-c C-c t") 'markdown-toc-generate-toc))))

(provide 'lang-init)

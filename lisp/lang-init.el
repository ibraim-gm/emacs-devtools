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

  ;; timer dependent config
  (dt-lang-flycheck/timer)

  ;; immediate/autoload config
  (dt-lang-smartparens)
  (dt-lang-rainbow-delimiters)
  (dt-lang-purpose)
  (dt-lang-yasnippet)
  (dt-lang-python)
  (dt-lang-cucumber)
  (dt-lang-web)
  (dt-lang-markdown)

  (run-with-timer
   1 nil
   (lambda ()
     (global-flycheck-mode))))

(defun dt-lang-smartparens ()
  (require 'smartparens-config)
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (add-hook 'web-mode-hook 'smartparens-mode)
  (sp-local-pair 'web-mode "{" nil :post-handlers '(:add dt--curly-braces-on-enter) :when '(("RET"))))

(defun dt--curly-braces-on-enter (id action context)
  (when (eq action 'insert)
    (newline)
    (indent-according-to-mode)
    (previous-line)
    (indent-according-to-mode)))

(defun dt-lang-flycheck/timer ()
  (eval-after-load "flycheck"
    '(progn
       (flycheck-add-mode 'javascript-eslint 'web-mode)
       (when (memq system-type '(ms-dos windows-nt))
	 (setq flycheck-xml-parser 'flycheck-parse-xml-region)))))

(defun dt-lang-rainbow-delimiters ()
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'web-mode-hook 'rainbow-delimiters-mode))

(defun dt-lang-purpose ()
  (eval-after-load "window-purpose"
    '(progn
       (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
       (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
       (purpose-compile-user-configuration)
       (define-key purpose-mode-map (kbd "C-x b") 'ivy-switch-buffer))))

(defun dt-lang-yasnippet ()
  (add-hook 'prog-mode-hook #'dt--enable-yasnippet)
  (add-hook 'text-mode-hook #'dt--enable-yasnippet)
  (eval-after-load "yasnippet"
    '(progn
       (when (not (boundp 'warning-suppress-types))
	 (setq warning-suppress-types nil))
       (add-to-list 'warning-suppress-types '(yasnippet backquote-change))
       (yas-reload-all))))

(defun dt--enable-yasnippet ()
  (interactive)
  (let ((buff (buffer-name (current-buffer))))
    (when (cond
           ((string= buff "*scratch*") nil)
           (t t))
      (yas-minor-mode 1))))

(defun dt-lang-python ()
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

(defun dt-lang-cucumber ()
  (setq feature-default-i18n-file (concat dt-data-dir "i18n.yml"))
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

(defun dt-lang-web ()
  (add-hook 'web-mode-hook 'dt--web-mode-hook)
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (eval-after-load "web-mode"
    '(progn
       (setq web-mode-content-types-alist
	     '(("jsx" . "\\.js[x]?\\'"))))))

(defun dt--web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t))

(defun dt-lang-markdown ()
  (eval-after-load "markdown-mode"
    '(progn
       (define-key markdown-mode-map (kbd "C-c C-c t") 'markdown-toc-generate-toc))))

(provide 'lang-init)

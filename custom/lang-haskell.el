;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2013 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-haskell.el --- Editing support for Haskell

(install-if-needed 'haskell-mode)
(load "haskell-mode-autoloads")

(setq haskell-notify-p t)
(setq haskell-tags-on-save t)
(setq haskell-stylish-on-save t)

;; Haskell main editing mode key bindings.
(defun haskell-hook ()
  ;; Use simple indentation.
  (turn-on-haskell-indentation)
  (turn-on-haskell-doc-mode)

  ;; Load the current file (and make a session if not already made).
  (define-key haskell-mode-map [?\C-c ?\C-l] 'haskell-process-load-file)
  (define-key haskell-mode-map [f5] 'haskell-process-load-file)

  ;; Switch/Bring the REPL, hiding all other windows
  (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)

  ;; Build the Cabal project.
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)

  ;; Interactively choose the Cabal command to run.
  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Contextually do clever things on the space key, in particular:
  ;; 1. Complete imports, letting you choose the module name.
  ;; 2. Show the type of the symbol after the space.
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; Jump to the definition of the current symbol.
  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Indent the below lines on columns after the current column.
  (define-key haskell-mode-map (kbd "M-<right>")
    (lambda ()
      (interactive)
      (haskell-move-nested 1)))

  ;; Same as above but backwards.
  (define-key haskell-mode-map (kbd "M-<left>")
    (lambda ()
      (interactive)
      (haskell-move-nested -1))))

;; Useful to have these keybindings for .cabal files, too.
(defun haskell-cabal-hook ()
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch))

;; add hooks
(add-hook 'haskell-mode-hook 'haskell-hook)
(add-hook 'haskell-cabal-mode-hook 'haskell-cabal-hook)

;; Ensure the tag generation works on Windows.
;; Already fixed, will be available on the next release.
;; See https://github.com/haskell/haskell-mode/issues/609 for details
(eval-after-load "haskell-commands"
  '(defun haskell-process-generate-tags (&optional and-then-find-this-tag)
     "Regenerate the TAGS table."
     (interactive)
     (let ((process (haskell-interactive-process)))
       (haskell-process-queue-command
        process
        (make-haskell-command
         :state (cons process and-then-find-this-tag)
         :go (lambda (state)
               (if (eq system-type 'windows-nt)
                   (haskell-process-send-string
                    (car state)
                    (format ":!hasktags --output=\"%s\\TAGS\" -x -e \"%s\""
                            (haskell-session-cabal-dir (haskell-process-session (car state)))
                            (haskell-session-cabal-dir (haskell-process-session (car state)))))
                 (haskell-process-send-string
                  (car state)
                  (format ":!cd %s && %s | %s"
                          (haskell-session-cabal-dir
                           (haskell-process-session (car state)))
                          "find . -name '*.hs' -print0 -or -name '*.lhs' -print0 -or -name '*.hsc' -print0"
                          "xargs -0 hasktags -e -x"))))
         :complete (lambda (state response)
                     (when (cdr state)
                       (let ((tags-file-name
                              (haskell-session-tags-filename
                               (haskell-process-session (car state)))))
                         (find-tag (cdr state))))
                     (haskell-mode-message-line "Tags generated.")))))))

(provide 'lang-haskell)

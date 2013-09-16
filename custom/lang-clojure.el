;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-clojure.el --- Setup clojure support. Use the awesome
;;; clojure-mode with nrepl and remap some keys to more sane values.

(install-if-needed 'clojure-mode)
(install-if-needed 'nrepl)

;; configure visibility of some default buffers
(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

;; Enable eldoc, rainbow delimiters adn subword mode
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

;; Shortcut for auto indenting clojure source and
;; starting loading a new repl in a leiningen project
(add-hook 'clojure-mode-hook
          (lambda ()
            (define-key clojure-mode-map (kbd "\r") 'newline-and-indent)
            (define-key clojure-mode-map [f5]
              (lambda ()
                (interactive)
                (nrepl-jack-in nil)
                ;; little trick to NOT split windows after connection
                (other-window 1)
                (delete-other-windows)))))

(provide 'lang-clojure)

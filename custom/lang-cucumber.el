;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2012 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; lang-cucumber.el --- Allow editing of cucumber files

(install-if-needed 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

                                        ;"Cenário:"
(font-lock-add-keywords 'feature-mode '(("Funcionalidade:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Característica:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Caracteristica:" . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Contexto:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Cenário de Fundo:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Cenario de Fundo:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Fundo:" . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Cenário:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Cenario:" . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Esquema do Cenário:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Esquema do Cenario:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Delineação do Cenário:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Delineacao do Cenario:" . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Exemplos:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Cenários:" . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Cenarios:" . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Dado " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Dada " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Dados " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Dadas " . font-lock-keyword-face)))

(font-lock-add-keywords 'feature-mode '(("Quando " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Então " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Entao " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("E " . font-lock-keyword-face)))
(font-lock-add-keywords 'feature-mode '(("Mas " . font-lock-keyword-face)))

;(font-lock-add-keywords 'clojure-mode '(("\\(\\^?:[a-zA-Z0-9\\?\\#\\-]+\\)" 1 'clojure-keyword-face)))

(provide 'lang-cucumber)

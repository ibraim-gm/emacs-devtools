;;; -*- coding: utf-8-unix; -*-
;;; Emacs-DevTools - An easy emacs setup for developers
;;;
;;; Copyright (C) 2017 by it's authors.
;;; All rights reserved. See LICENSE, AUTHORS.
;;;
;;; dt-install.el --- emacs-devtools setup helpers

;;;###autoload
(defun dt-install ()
  "Install and configure emacs-devtools."
  (interactive)
  (setq custom-file "~/.emacs-custom")
  (dt-update-all-autoloads)
  (dt-install-packages)
  (dt-save-custom-values)
  (dt-generate-dot-emacs))

;;;###autoload
(defun dt-install-packages ()
  "Install any missing packages."
  (interactive)
  (dt--install-and-configure-quelpa)
  (dt--install-all-quelpa-packages))

;;;###autoload
(defun dt-generate-dot-emacs ()
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
    (insert "  (setq custom-file \"~/.emacs-custom\")")(newline)
    (insert "  (when (= (length command-line-args) 1)")(newline)
    (insert "    (setq default-directory \"~/\"))")(newline)
    (insert "  (load custom-file :noerror t)")(newline)
    (insert "  (load \"" (concat user-emacs-directory "dt-const.el") "\")")(newline)
    (insert "  (load dt-loaddefs-file)")(newline)
    (insert "  (add-to-list 'load-path dt-src-dir)")(newline)
    (newline)
    (insert "  (dt-editor-init)")(newline)
    (insert "  (dt-completion-init)")(newline)
    (insert "  (dt-lang-init)")(newline)
    (newline)
    (insert "  (run-with-idle-timer")(newline)
    (insert "   5 nil")(newline)
    (insert "   (lambda ()")(newline)
    (insert "     (setq gc-cons-threshold 800000))))")(newline)
    (save-buffer))
  (kill-buffer ".emacs"))

(defun dt--install-and-configure-quelpa ()
  (setq quelpa-update-melpa-p nil)
  (unless (require 'quelpa nil t)
    (with-temp-buffer
      (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
      (eval-buffer))
    (require 'quelpa)))

(defun dt--install-all-quelpa-packages ()
  (quelpa '(spacemacs-theme    :repo "nashamri/spacemacs-theme"     :fetcher github :commit "b26162e8974c532b3241a43c8f194a340636e9ea"))
  (quelpa '(async              :repo "jwiegley/emacs-async"         :fetcher github :commit "v1.9.2"))
  (quelpa '(ivy                :repo "abo-abo/swiper"               :fetcher github :commit "0.9.1" :files (:defaults (:exclude "swiper.el" "counsel.el" "ivy-hydra.el") "doc/ivy-help.org")))
  (quelpa '(flx                :repo "lewang/flx"                   :fetcher github :commit "v0.6.1" :files ("flx.el")))
  (quelpa '(ag                 :repo "Wilfred/ag.el"                :fetcher github :commit "0.47"))
  (quelpa '(dumb-jump          :repo "jacktasia/dumb-jump"          :fetcher github :commit "8fae9be1b630c57d5d40586bddda70024006701f"))
  (quelpa '(company            :repo "company-mode/company-mode"    :fetcher github :commit "0.9.4"))
  (quelpa '(projectile         :repo "bbatsov/projectile"           :fetcher github :commit "v0.14.0" :files ("projectile.el")))
  (quelpa '(counsel-projectile :repo "ericdanan/counsel-projectile" :fetcher github :commit "aefd25c74718e66f180127c0d273eade887325b0"))
  (quelpa '(sr-speedbar        :repo "emacsorphanage/sr-speedbar"   :fetcher github :commit "20140914.2339"))
  (quelpa '(window-purpose     :repo "bmag/emacs-purpose"           :fetcher github :commit "v1.6" :files (:defaults "layouts") :old-names (purpose)))
  (quelpa '(magit              :repo "magit/magit"                  :fetcher github :commit "2.10.3" :files ("lisp/magit*.el" "lisp/git-rebase.el" "Documentation/magit.texi" "Documentation/AUTHORS.md" "COPYING" (:exclude "lisp/magit-popup.el"))))
  (quelpa '(cheatsheet         :repo "darksmile/cheatsheet"         :fetcher github :commit "e4f8e0110167ea16a17a74517d1f10cb7ff805b8"))
  (quelpa '(which-key          :repo "justbur/emacs-which-key"      :fetcher github :commit "v3.0.1"))
  (quelpa '(web-mode           :repo "fxbois/web-mode"              :fetcher github :commit "v15"))
  (quelpa '(smartparens        :repo "Fuco1/smartparens"            :fetcher github :commit "1.10.1"))
  (quelpa '(rainbow-delimiters :repo "Fanael/rainbow-delimiters"    :fetcher github :commit "2.1.3"))
  (quelpa '(flycheck           :repo "flycheck/flycheck"            :fetcher github :commit "ed08ce36e5cc97cfabb84ccaba84a00db917f082"))
  (quelpa '(yasnippet          :repo "joaotavora/yasnippet"         :fetcher github :commit "0.12.1" :files ("yasnippet.el" "snippets")))
  (quelpa '(pyvenv             :repo "jorgenschaefer/pyvenv"        :fetcher github :commit "v1.10"))
  (quelpa '(elpy               :repo "jorgenschaefer/elpy"          :fetcher github :commit "1.16.0" :files ("*.el" "NEWS.rst" "snippets" "elpy")))
  (quelpa '(feature-mode       :repo "michaelklishin/cucumber.el"   :fetcher github :commit "v0.4" :files ("*.el" "i18n.yml" "snippets" "support")))
  (quelpa '(markdown-mode      :repo "jrblevin/markdown-mode"       :fetcher github :commit "v2.2"))
  (quelpa '(markdown-toc       :repo "ardumont/markdown-toc"        :fetcher github :commit "0.1.2")))

(provide 'dt-install)

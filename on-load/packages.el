;;; packages -- Required packages for this repo.
;;; Commentary:
;; Load this file to get all the packages (bloat).
;;; Code:
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/") discouraged repo, but your choice
                         ("melpa-unstable" . "http://melpa.milkbox.net/packages/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(package-initialize)

(defun require-package (package)
  "If PACKAGE does not exist, install it."
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; Get packages
(require-package 'use-package)
(require-package 'zop-to-char)
(require-package 'powerline)
(require-package 'helm)
(require-package 'sublimity)
(require-package 'achievements)
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'yasnippet)
(require-package 'company)
(require-package 'golden-ratio)
(require-package 'pretty-lambdada)
(require-package 'evil-multiedit)
(require-package 'ace-mc)
(require-package 'switch-window)
(require-package 'exwm)
(require-package 'avy)
(require-package 'evil-god-state)
(require-package 'evil-escape)
(require-package 'avy-menu)
(require-package 'ido-vertical-mode)
(require-package 'ido-ubiquitous)
(require-package 'evil-snipe)
(require-package 'helm-config)
(require-package 'sublimity-attractive)
(require-package 'company-quickhelp)
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'org-bullets)
(require-package 'slime)
(require-package 'evil-easymotion)
(require-package 'multiple-cursors)
(require-package 'zop-to-char)
(require-package 'wrap-region)
(require-package 'rich-minority)
(require-package 'fancy-battery)
(require-package 'paredit)
(require-package 'evil-tabs)
(require-package 'evil-surround)
(require-package 'deft)
(require-package 'cheatsheet)

(provide 'packages)

;;; packages.el ends here

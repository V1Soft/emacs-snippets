;;; config -- Generic config for Emacs (variables) and packages w/ not alot of variables set.
;;; Commentary:
;; Changes:
;; -----------------
;; Show parens = 1
;; No backup files
;; Elscreen does not display tabs
;; Browser = Firefox
;; Emacs' startup message does not show
;; Scroll margin changes
;;; Code:
(setq-default show-paren-mode t)
(setq-default make-backup-files nil)
(setq-default elscreen-display-tab nil)

;; Set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;; stop emacs' startup message
(setq inhibit-startup-message t)
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(provide 'config)
;;; config.el ends here

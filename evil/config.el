;;; config -- Configuration for Emacs' Evil mode.
;;; Commentary:
;; Changes:
;; -------------
;; Cursor state colors.
;; Tilde and backslash do God-Mode related things.
;; C-s in normal mode opens Swiper.
;; Some movements.
;;
;; Code:
(require 'evil)
(require 'swiper)

(evil-mode 1)
(setq-default evil-emacs-state-cursor '("blue" box))
(setq-default evil-normal-state-cursor '("gray" box))
(setq-default evil-visual-state-cursor '("orange" box))
(setq-default evil-insert-state-cursor '("green" bar))
(setq-default evil-replace-state-cursor '("red" bar))
(setq-default evil-operator-state-cursor '("red" hollow))
(setq-default evil-god-state-cursor '("purple" box))
(evil-define-key 'god global-map [escape] 'evil-god-state-bail)
(evil-define-key 'normal global-map "\\" 'evil-execute-in-god-state)
(evil-define-key 'normal global-map "~" 'evil-god-state)
(evil-define-key 'normal global-map (kbd "C-s") 'swiper)

(define-key evil-motion-state-map "0" 'evil-end-of-line)
(define-key evil-motion-state-map "$" 'evil-beginning-of-line)
(define-key evil-motion-state-map ";" 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char)
(define-key evil-normal-state-map (kbd "C-z") (progn (evil-mode 0)
                                                     (god-local-mode 1)))

(provide 'config)
;;; config.el ends here

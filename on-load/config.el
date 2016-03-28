;;; config -- Configurations for Emacs' Evil mode.
;;; Commentary:
;; Changes:
;; ----------------
;; Cursor state colors.
;; Tilde and backslash is remaped to evil-god state.
;; C-s in normal mode opens Swiper.
;;; Code:
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

(provide 'config)
;;; config.el ends here
